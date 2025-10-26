import UIKit
import WebKit
import CoreMIDI
import UniformTypeIdentifiers
import ObjectiveC

extension WebView {
    final class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate, UIDocumentPickerDelegate {
        var webView: WKWebView?
        private var client = MIDIClientRef()
        private var inputPort = MIDIPortRef()
        private var connected = Set<MIDIEndpointRef>()
        private var didLoadDefaultMIDI = false
        private let allowedBasePath: String

        init(allowedBasePath: String) {
            if allowedBasePath.isEmpty || allowedBasePath.hasSuffix("/") {
                self.allowedBasePath = allowedBasePath
            } else {
                self.allowedBasePath = allowedBasePath + "/"
            }
            super.init()
        }

        func setupMIDI() {
            MIDIClientCreateWithBlock("PolarPitchMIDI" as CFString, &client) { [weak self] _ in
                self?.rescanMIDISources()
            }
            MIDIInputPortCreateWithBlock(client, "In" as CFString, &inputPort) { [weak self] pktList, _ in
                guard let self, let web = self.webView else { return }

                let listPtr = UnsafeMutablePointer<MIDIPacketList>(mutating: pktList)
                var pktPtr = withUnsafeMutablePointer(to: &listPtr.pointee.packet) { $0 }

                for _ in 0..<listPtr.pointee.numPackets {
                    let len = Int(pktPtr.pointee.length)
                    let bytes: [UInt8] = withUnsafeBytes(of: &pktPtr.pointee.data) { raw in
                        Array(raw.prefix(len))
                    }
                    if let json = try? JSONSerialization.data(withJSONObject: bytes),
                       let s = String(data: json, encoding: .utf8) {
                        DispatchQueue.main.async {
                            web.evaluateJavaScript("window._midi_from_native(\(s));", completionHandler: nil)
                        }
                    }
                    pktPtr = MIDIPacketNext(pktPtr)
                }
            }
            rescanMIDISources()
        }

        private func rescanMIDISources() {
            var seen = Set<MIDIEndpointRef>()
            let n = MIDIGetNumberOfSources()
            for i in 0..<n {
                let src = MIDIGetSource(i)
                seen.insert(src)
                if !connected.contains(src) {
                    MIDIPortConnectSource(inputPort, src, nil)
                    connected.insert(src)
                }
            }
            for src in connected.subtracting(seen) {
                MIDIPortDisconnectSource(inputPort, src)
                connected.remove(src)
            }
        }

        // <input type="file">
        func webView(_ webView: WKWebView,
                     runOpenPanelWith parameters: WKOpenPanelParameters,
                     initiatedByFrame frame: WKFrameInfo,
                     completionHandler: @escaping ([URL]?) -> Void) {
            let types: [UTType] = [.midi, .audio, .data]
            let picker = UIDocumentPickerViewController(forOpeningContentTypes: types)
            picker.delegate = self
            picker.allowsMultipleSelection = false
            objc_setAssociatedObject(picker, &WebViewAssocKey, completionHandler, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            topController()?.present(picker, animated: true)
        }
        func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
            
            // 以前のアクセスを解放
            for u in securityScopedURLs { u.stopAccessingSecurityScopedResource() }
            securityScopedURLs.removeAll()

            // 新規URLに対してアクセス開始（スコープ付与）
            for u in urls {
                if u.startAccessingSecurityScopedResource() {
                    securityScopedURLs.append(u)
                }
            }

            // WebKitへ引き渡し（<input type="file"> に反映）
            if let h = objc_getAssociatedObject(controller, &WebViewAssocKey) as? ([URL]?)->Void { h(urls) }
            objc_setAssociatedObject(controller, &WebViewAssocKey, nil, .OBJC_ASSOCIATION_ASSIGN)
        }

        func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
            if let h = objc_getAssociatedObject(controller, &WebViewAssocKey) as? ([URL]?)->Void { h(nil) }
            objc_setAssociatedObject(controller, &WebViewAssocKey, nil, .OBJC_ASSOCIATION_ASSIGN)
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            guard !didLoadDefaultMIDI,
                  let url = Bundle.main.url(forResource: "sample", withExtension: "mid"),
                  let data = try? Data(contentsOf: url) else { return }
            didLoadDefaultMIDI = true
            let base64 = data.base64EncodedString()
            guard let argsData = try? JSONSerialization.data(withJSONObject: [base64, "sample.mid"]),
                  let args = String(data: argsData, encoding: .utf8) else { return }
            let js = "(() => { const args = " + args + "; window.__loadMIDIFromNative && window.__loadMIDIFromNative(args[0], args[1]); })();"
            DispatchQueue.main.async {
                webView.evaluateJavaScript(js, completionHandler: nil)
            }
        }

        @available(iOS 15.0, *)
        func webView(_ webView: WKWebView,
                     requestMediaCapturePermissionFor origin: WKSecurityOrigin,
                     initiatedByFrame frame: WKFrameInfo,
                     type: WKMediaCaptureType,
                     decisionHandler: @escaping (WKPermissionDecision) -> Void) {
            guard origin.protocol == "file",
                  let currentURL = webView.url,
                  isAllowedNavigationURL(currentURL) else {
                decisionHandler(.deny)
                return
            }
            decisionHandler(.grant)
        }

        private func topController() -> UIViewController? {
            guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return nil }
            return scene.windows.first { $0.isKeyWindow }?.rootViewController
        }

        func webView(_ webView: WKWebView,
                     decidePolicyFor navigationAction: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let url = navigationAction.request.url,
                  isAllowedNavigationURL(url) else {
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }

        private func isAllowedNavigationURL(_ url: URL) -> Bool {
            if url.scheme == "about" { return true }
            guard url.isFileURL else { return false }
            guard !allowedBasePath.isEmpty else { return false }
            let standardizedPath = url.standardizedFileURL.path
            return standardizedPath.hasPrefix(allowedBasePath)
        }
    }
}

private var WebViewAssocKey: UInt8 = 0
// 取得中のセキュリティスコープ付きURLを保持
private var securityScopedURLs: [URL] = []

