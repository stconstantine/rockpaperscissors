//
//  GameProcess.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import Foundation

class Game {

    var state: gameStates
    var botSign: Sign
    
        
    init() {
        self.state = .start
        self.botSign = randomSign()
    }
}

