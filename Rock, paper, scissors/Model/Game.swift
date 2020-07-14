//
//  GameProcess.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation

class Game {
    enum GameState {
        case start, win, lose, draw
    }
    
    var state: GameState
    var botSign, playerSign: Sign
    
    func gameResult(bot botThrow: Sign, player playerTrow: Sign) -> GameState {
        if botThrow == playerTrow {return .draw}
        else if botThrow.strongerThen == playerTrow {return .lose}
        else if playerTrow.strongerThen == botThrow {return .win}
        preconditionFailure("Error in gameResult func. Failed to choose a winner")
    }
        
    init() {
        self.state = .start
        self.botSign = randomSign()
        self.playerSign = randomSign()
    }
}

