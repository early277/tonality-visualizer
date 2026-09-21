import UIKit
import WebKit

final class PracticeHapticsHandler: NSObject, WKScriptMessageHandler {
    private let impact = UIImpactFeedbackGenerator(style: .heavy)
    private var pending: [DispatchWorkItem] = []
    private func stop() { pending.forEach { $0.cancel() }; pending.removeAll() }
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        guard message.frameInfo.isMainFrame,
              message.frameInfo.request.url?.isFileURL == true,
              let event = message.body as? String else { return }
        if event == "stop" { stop(); return }
        if event == "prepare" { stop(); impact.prepare(); return }
        let beats: [Double]
        switch event {
        case "hit": beats = [0]
        case "miss": beats = [0]
        case "damage": beats = [0, 0.12]
        case "critical": beats = [0, 0.16, 0.32]
        case "gameover": beats = [0, 0.13, 0.28]
        case "combo": beats = [0, 0.09, 0.21]
        case "clear": beats = [0, 0.10, 0.24, 0.42, 0.65]
        default: return
        }
        stop()
        for delay in beats {
            if delay == 0 { impact.impactOccurred(intensity: 1); impact.prepare(); continue }
            let work = DispatchWorkItem { [weak self] in
                guard UIApplication.shared.applicationState == .active else { return }
                self?.impact.impactOccurred(intensity: 1)
                self?.impact.prepare()
            }
            pending.append(work)
            DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: work)
        }
    }
    deinit { pending.forEach { $0.cancel() } }
}
