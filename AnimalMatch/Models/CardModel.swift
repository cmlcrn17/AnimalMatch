import Foundation

/// Model representing a single card in the game grid.
struct Card: Identifiable {
    let id: UUID = UUID()
    let emoji: String
    var isFlipped: Bool = false
    var isMatched: Bool = false
    /// Placeholder cards fill uneven grids and are ignored by the game logic.
    var isPlaceholder: Bool = false
}
