import SwiftUI

/// Main game screen showing the grid, score and timer.
struct GameView: View {
    @StateObject var viewModel: GameViewModel
    @EnvironmentObject var settings: AppSettings

    var body: some View {
        VStack {
            HStack {
                Text("Score: \(viewModel.score)")
                Spacer()
                Text("Time: \(viewModel.timeElapsed)s")
            }
            .padding()

            let columns = Array(repeating: GridItem(.flexible()), count: viewModel.gridSize)

            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModel.select(card)
                        }
                        .frame(height: 80)
                }
            }
            .padding()

            Spacer()
        }
        .navigationTitle("Level \(viewModel.level)")
        .onAppear {
            AudioManager.shared.playBackgroundMusic()
        }
        .fullScreenCover(isPresented: $viewModel.gameFinished) {
            WinView(viewModel: viewModel)
                .environmentObject(settings)
        }
    }
}
