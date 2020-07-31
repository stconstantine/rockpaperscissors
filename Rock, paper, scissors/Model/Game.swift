//
//  GameProcess.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation
import GameplayKit

struct Game {
    enum GameState {
        case start, win, lose, draw
    }
    
    var state: GameState
    var botSign: Sign = .rock, playerSign: Sign = .rock
    
    func gameResult(bot botThrow: Sign, player playerTrow: Sign) -> GameState {
        if botThrow == playerTrow {return .draw}
        else if botThrow.strongerThen == playerTrow {return .lose}
        else if playerTrow.strongerThen == botThrow {return .win}
        preconditionFailure("Error in gameResult func. Failed to choose a winner")
    }
    
    let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: Sign.allCases.count-1)
    
    func randomSign () -> Sign {
        let sign = randomChoice.nextInt()
        switch sign {
        case 0: return .rock
        case 1: return .paper
        case 2: return .scissors
        default: preconditionFailure("Randomizer generated the sign out of available range. Need to shrink random or expand sign variants.")
        }
    }
    
    init() {
        self.state = .start
    }
}

