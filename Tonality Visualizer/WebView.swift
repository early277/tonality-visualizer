import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        let basePath = Bundle.main.resourceURL?.standardizedFileURL.path ?? ""
        return Coordinator(allowedBasePath: basePath)
    }

    func makeUIView(context: Context) -> WKWebView {
        let uc = WKUserContentController()
        let preJS = """
        window.__NATIVE_APP__ = true;
        (function(){
          function makeInput(){
            const listeners = new Set();
            const inp = {
              id: "core",
              name: "iOS CoreMIDI",
              onmidimessage: null,
              addEventListener: (t, cb)=>{ if(t==='midimessage' && cb) listeners.add(cb); },
              removeEventListener: (t, cb)=>{ if(t==='midimessage' && cb) listeners.delete(cb); },
              open: ()=>Promise.resolve(inp)
            };
            window._midi_from_native = function(bytes){
              const ev = { data: new Uint8Array(bytes), target: inp, currentTarget: inp, receivedTime: performance.now() };
              if (typeof inp.onmidimessage === 'function') inp.onmidimessage(ev);
              listeners.forEach(fn=>{ try{ fn(ev); }catch(e){} });
            };
            return inp;
          }
          navigator.requestMIDIAccess = function(){
            const inp = makeInput();
            const access = { inputs: new Map([['core', inp]]), outputs: new Map(), onstatechange: null };
            return Promise.resolve(access);
          };
        })();
        """
        uc.addUserScript(WKUserScript(source: preJS, injectionTime: .atDocumentStart, forMainFrameOnly: true))

        let cfg = WKWebViewConfiguration()
        cfg.userContentController = uc
        cfg.allowsInlineMediaPlayback = true
        cfg.defaultWebpagePreferences.allowsContentJavaScript = true

        let wv = WKWebView(frame: .zero, configuration: cfg)
        wv.uiDelegate = context.coordinator
        wv.navigationDelegate = context.coordinator
        context.coordinator.webView = wv
        context.coordinator.setupMIDI()

        if let url = Bundle.main.url(forResource: "index", withExtension: "html") {
            wv.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
        return wv
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
