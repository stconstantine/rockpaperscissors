//
//  Sign.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation
import GameplayKit

// Data types for the "hand" signs and proper emoji
// May be i should used Dictionary here instead enum...

enum Sign: CaseIterable {
    case rock, paper, scissors
    var emoji: String {
        switch self {
        case .rock: return "👊🏼"
        case .paper: return "✋🏼"
        case .scissors: return "✌🏼"
        }
    }
    var strongerThen: Sign {
        switch self {
        case .rock: return .scissors
        case .paper: return .rock
        case .scissors: return .paper
        }
    }
}

func getSignByEmoji(_ emoji: String) -> Sign {
    for sign in Sign.allCases {
        if sign.emoji == emoji {
            return sign
        }
    }
    preconditionFailure("Somewhy coudn't identify the sign by its emodji. May be emodji is wrong.")
}

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)
func randomSign () -> Sign {
    let sign = randomChoice.nextInt()
    switch sign {
    case 0: return .rock
    case 1: return .paper
    case 2: return .scissors
    default: preconditionFailure("Randomizer generated the sign out of available range. Need to shrink random or expand sign variants.")
    }
}
