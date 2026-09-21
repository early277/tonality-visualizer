import UIKit
import WebKit

final class AppOrientationDelegate: NSObject, UIApplicationDelegate {
    static var allowed: UIInterfaceOrientationMask = .allButUpsideDown
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        Self.allowed
    }

    // A terminated/reloaded WKWebView cannot send the normal "deactivate"
    // message.  Never let the practice-only lock survive an app background
    // transition in that case.
    func applicationDidEnterBackground(_ application: UIApplication) {
        Self.allowed = .allButUpsideDown
    }

    static func releasePracticeLock() {
        allowed = .allButUpsideDown
    }
}

final class PracticeOrientationHandler: NSObject, WKScriptMessageHandlerWithReply {
    private var previous: UIInterfaceOrientation?

    deinit {
        // If WebKit tears down the content process while practice is open,
        // there may be no final JavaScript message.  Release the global lock.
        AppOrientationDelegate.releasePracticeLock()
    }

    func userContentController(_ userContentController: WKUserContentController,
                               didReceive message: WKScriptMessage,
                               replyHandler: @escaping (Any?, String?) -> Void) {
        guard message.frameInfo.isMainFrame,
              message.frameInfo.request.url?.isFileURL == true,
              let active = message.body as? Bool,
              let scene = message.webView?.window?.windowScene else {
            replyHandler(nil, "Orientation unavailable")
            return
        }
        if active && previous == nil { previous = scene.interfaceOrientation }
        AppOrientationDelegate.allowed = active ? .landscape : .allButUpsideDown
        var requested: UIInterfaceOrientationMask = .landscape
        if !active {
            switch previous {
            case .landscapeLeft: requested = .landscapeLeft
            case .landscapeRight: requested = .landscapeRight
            default: requested = .portrait
            }
            previous = nil
        }
        for window in scene.windows {
            var controller = window.rootViewController
            while let current = controller {
                current.setNeedsUpdateOfSupportedInterfaceOrientations()
                controller = current.presentedViewController
            }
        }
        scene.requestGeometryUpdate(.iOS(interfaceOrientations: requested)) { error in
            print("Practice orientation request: \(error.localizedDescription)")
        }
        replyHandler(true, nil)
    }
}
