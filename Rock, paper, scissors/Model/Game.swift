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
    var botSign: Sign
    
    func gameResult(bot botThrow: Sign, player playerTrow: Sign) -> GameState {
        return .win
    }
        
    init() {
        self.state = .start
        self.botSign = randomSign()
    }
}

