import SwiftUI

@main
struct AnimalMatchApp: App {
    @StateObject private var settings = AppSettings.shared

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(settings)
        }
    }
}
