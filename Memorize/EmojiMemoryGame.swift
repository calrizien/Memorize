//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Brandon Winston on 5/23/20.
//  Copyright © 2020 Bwinston. All rights reserved.
//

import SwiftUI

// View Model Controller
class EmojiMemoryGame: ObservableObject {
	@Published private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

	static func createMemoryGame() -> MemoryGame<String> {
		let emojis = ["👻", "🎃", "🕷"]
		return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
			return emojis[pairIndex]
		}
	}
	// MARK: - Access to the Model

	var cards: Array<MemoryGame<String>.Card> {
		model.cards
	}
	// MARK: - Intent(s)

	func choose(card: MemoryGame<String>.Card) {
		objectWillChange.send()
		model.choose(card: card)
	}
}
