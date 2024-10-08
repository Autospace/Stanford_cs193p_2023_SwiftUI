import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "👽", "☠️", "🍭", "✅"]
    typealias Card = MemoryGame<String>.Card

    @Published private var model = createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 9) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }

    
    var cards: Array<Card> {
        model.cards
    }

    var color: Color {
        .orange
    }

    var score: Int {
        model.score
    }

    // MARK: - Intents

    func shuffle() {
        model.shuffle()
        print(model.cards)
    }

    func choose(_ card: Card) {
        model.choose(card)
    }
}

