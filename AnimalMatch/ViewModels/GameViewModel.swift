import Foundation
import SwiftUI

/// ViewModel handling game logic and scoring.
final class GameViewModel: ObservableObject {
    @Published var cards: [Card] = []
    @Published var score: Int = 0
    @Published var timeElapsed: Int = 0
    @Published var gameFinished: Bool = false
    @Published var level: Int = 1

    private var firstSelectedIndex: Int?
    private var lastMatchTime: Date = Date()
    private var timer: Timer?
    private let settings: AppSettings

    /// Available animal emojis. In future versions these can be replaced with image assets.
    private let animals = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐸","🐵","🐔","🐧","🐦","🐤","🐴","🦄","🐝","🐛","🦋","🐢","🐍","🦖","🦕"]

    init(settings: AppSettings) {
        self.settings = settings
        startGame()
    }

    /// Computes the current grid size based on level. Levels grow until 6x6.
    var gridSize: Int {
        return min(3 + (level - 1), 6)
    }

    /// Starts or restarts the game for the current level.
    func startGame() {
        score = 0
        timeElapsed = 0
        gameFinished = false
        firstSelectedIndex = nil
        lastMatchTime = Date()

        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            self?.timeElapsed += 1
        }

        let totalCards = gridSize * gridSize
        let pairCount = totalCards / 2
        var availableEmojis = animals.shuffled()
        cards = []

        for _ in 0..<pairCount {
            guard let emoji = availableEmojis.popLast() else { continue }
            let card1 = Card(emoji: emoji)
            let card2 = Card(emoji: emoji)
            cards.append(contentsOf: [card1, card2])
        }

        cards.shuffle()

        // Handle odd grids by adding a placeholder card that is always matched.
        if totalCards % 2 == 1 {
            cards.append(Card(emoji: "🐾", isFlipped: true, isMatched: true, isPlaceholder: true))
        }
    }

    /// Handles user selection of a card.
    func select(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        if cards[index].isFlipped || cards[index].isMatched || cards[index].isPlaceholder { return }

        cards[index].isFlipped = true

        if let first = firstSelectedIndex {
            // Second card selected, evaluate match
            if cards[first].emoji == cards[index].emoji {
                cards[first].isMatched = true
                cards[index].isMatched = true
                let bonus = max(0, 5 - Int(Date().timeIntervalSince(lastMatchTime)))
                score += 10 + bonus
                AudioManager.shared.playMatchSound()
                lastMatchTime = Date()
                checkForWin()
            } else {
                score = max(0, score - 1)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.cards[first].isFlipped = false
                    self.cards[index].isFlipped = false
                }
            }
            firstSelectedIndex = nil
        } else {
            // First card selected
            firstSelectedIndex = index
        }
    }

    /// Checks whether all pairs have been matched.
    private func checkForWin() {
        if cards.filter({ !$0.isMatched && !$0.isPlaceholder }).isEmpty {
            gameFinished = true
            timer?.invalidate()
            if score > settings.highScore {
                settings.highScore = score
            }
        }
    }

    /// Advances to the next level and restarts the game.
    func nextLevel() {
        level += 1
        startGame()
    }
}
