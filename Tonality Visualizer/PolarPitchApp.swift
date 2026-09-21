import SwiftUI

@main
struct PolarPitchApp: App {
    @UIApplicationDelegateAdaptor(AppOrientationDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup { ContentView() }
    }
}
