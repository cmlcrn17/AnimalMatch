import SwiftUI

/// Home screen with navigation to game, levels and settings.
struct HomeView: View {
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                NavigationLink("Start Game") {
                    GameView(viewModel: GameViewModel(settings: settings))
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Levels") {
                    LevelsView()
                }
                .buttonStyle(.bordered)

                NavigationLink("Settings") {
                    SettingsView()
                }
                .buttonStyle(.bordered)

                Spacer()
            }
            .padding()
            .navigationTitle("AnimalMatch")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(AppSettings.shared)
    }
}
