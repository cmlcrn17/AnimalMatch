import SwiftUI

/// Screen presented when the player completes a level.
struct WinView: View {
    @ObservedObject var viewModel: GameViewModel
    @EnvironmentObject var settings: AppSettings
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 20) {
            Text("🎉 You Win! 🎉")
                .font(.largeTitle)
                .bold()
            Text("Score: \(viewModel.score)")
            Text("Best: \(settings.highScore)")
            HStack(spacing: 40) {
                Button("Replay") {
                    viewModel.startGame()
                    dismiss()
                }
                Button("Next Level") {
                    viewModel.nextLevel()
                    dismiss()
                }
            }
            .padding(.top, 20)
        }
        .padding()
        .onAppear {
            // Simple placeholder for a confetti animation.
            // In a real project you might use a particle system or Lottie animation here.
        }
    }
}

struct WinView_Previews: PreviewProvider {
    static var previews: some View {
        WinView(viewModel: GameViewModel(settings: AppSettings.shared))
            .environmentObject(AppSettings.shared)
    }
}
