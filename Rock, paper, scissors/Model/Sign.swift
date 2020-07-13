//
//  Sign.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation
import GameplayKit

// Data types for the "hand" states and proper emoji
enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .rock: return "👊🏼"
        case .paper: return "✋🏼"
        case .scissors: return "✌🏼"
        }
    }
}


// randomizer for the bot choice. Method — nextInt() on instance to get an Int

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign () -> Sign {
    let sign = randomChoice.nextInt()
    switch sign {
    case 0: return .rock
    case 1: return .paper
    case 2: return .scissors
    default: preconditionFailure("Randomizer generated the sign out of range. Need to shrink random or expand sign variants.")
    }
}
