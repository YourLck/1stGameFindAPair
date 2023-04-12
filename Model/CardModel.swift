//
//  CardModel.swift
//  1stGameFindAPair
//
//  Created by Nikita Nemtsu on 12.04.2023.
//

import UIKit

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier = 0
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}
