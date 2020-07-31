//
//  Sign.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation

enum Sign: CaseIterable {
    case rock, paper, scissors
    var emoji: String {
        switch self {
        case .rock: return "👊🏼"
        case .paper: return "✋🏼"
        case .scissors: return "✌🏼"
        }
    }
    
    func beats(_ otherSign: Sign) -> Bool {
        switch self {
        case .rock:
            return otherSign == .scissors
        case .paper:
            return otherSign == .rock
        case .scissors:
            return otherSign == .paper
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
