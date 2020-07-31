//
//  Sign.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation


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
    
    init (emoji: String) {
        switch emoji {
        case "👊🏼": self = .rock
        case "✋🏼": self = .paper
        case "✌🏼": self = .scissors
        default: fatalError("Sign init(): recieved emoji, that didn't correspond to any sign")
        }
    }
    
}
