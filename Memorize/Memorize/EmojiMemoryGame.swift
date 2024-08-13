import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "🎃", "🕷️", "😈", "💀", "🕸️", "🧙", "🙀", "👹", "👽", "☠️", "🍭", "✅"]

    @Published private var model = createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 11) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }

    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }

    // MARK: - Intents

    func shuffle() {
        model.shuffle()
        print(model.cards)
    }

    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

