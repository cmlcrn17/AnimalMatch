import SwiftUI

/// Simple settings page allowing the user to enable or disable audio.
struct SettingsView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        Form {
            Toggle("Sound Effects", isOn: $settings.soundEnabled)
            Toggle("Background Music", isOn: $settings.musicEnabled)
        }
        .navigationTitle("Settings")
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(AppSettings.shared)
    }
}
