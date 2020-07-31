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
    var botSign, playerSign: Sign
    
    func gameResult(bot botThrow: Sign, player playerTrow: Sign) -> GameState {
        if botThrow.beats(playerTrow) {
            return .lose
        } else if playerTrow.beats(botThrow) {
            return .win
        } else {
            return .draw
        }
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
    
    init(botSign: Sign, playerSign: Sign) {
        self.state = .start
        self.botSign = botSign
        self.playerSign = playerSign
    }
}

