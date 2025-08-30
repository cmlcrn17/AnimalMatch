import SwiftUI

/// Visual representation of a single card.
struct CardView: View {
    let card: Card

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(card.isFlipped || card.isMatched ? Color.white : Color.blue)
                .shadow(radius: 4)

            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.blue, lineWidth: 2)

            if card.isFlipped || card.isMatched {
                Text(card.emoji)
                    .font(.system(size: 40))
            } else {
                Text("❓")
                    .font(.system(size: 40))
                    .foregroundColor(.white)
            }
        }
        .rotation3DEffect(.degrees(card.isFlipped ? 0 : 180), axis: (x: 0, y: 1, z: 0))
        .animation(.easeInOut(duration: 0.3), value: card.isFlipped)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card(emoji: "🐶"))
            .frame(width: 80, height: 80)
    }
}
