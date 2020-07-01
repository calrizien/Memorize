//
//  Grid.swift
//  Memorize
//
//  Created by Brandon Winston on 6/8/20.
//  Copyright © 2020 Bwinston. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View {
	var items: [Item]
	var viewForItem: (Item) -> ItemView

	init(_ items: [Item], @escaping viewForItem: (Item) -> ItemView) {
		self.items = items
		self.viewForItem = viewForItem
	}
	var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}


