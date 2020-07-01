//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Brandon Winston on 5/22/20.
//  Copyright © 2020 Bwinston. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
	@ObservedObject var viewModel: EmojiMemoryGame
	
	var body: some View {
		Grid(items: viewModel.cards) { card in
			CardView(card: card).onTapGesture {
				self.viewModel.choose(card: card)
			}
		}
		.padding()
		.foregroundColor(Color.orange)
		.font(Font.largeTitle)
	}
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
		EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}

struct CardView: View {

	var card: MemoryGame<String>.Card
	var body: some View {
		GeometryReader { geometry in
			self.body(for: geometry.size)
		}
	}

	func body(for size: CGSize) -> some View {
		ZStack() {
			if card.isFaceUp {
				RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
				RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
				Text(card.content)
			} else {
				RoundedRectangle(cornerRadius: cornerRadius).fill()
			}
		}
		.font(Font.system(size: fontSize(for: size)))
	}

	// MARK: - Drawing Constants

	let cornerRadius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3
	func fontSize(for size: CGSize) -> CGFloat { 
		min(size.width, size.height) * 0.75
	}
}
