//
//  ViewController.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let botFace = "🦊"
    var game = Game()

    override func viewDidLoad() {
          super.viewDidLoad()
        updateState(for: .start)
      }
      
    @IBOutlet weak var botChoice: UILabel!
    @IBOutlet weak var statusLine: UILabel!
    @IBOutlet weak var statusSubline: UILabel!
    @IBOutlet var playerSigns: [UIButton]!
        
    func updateState (for currentState: gameStates) {
        switch currentState {
        case .start: do {
            // TODO: make a loop and independent of Sign count
            playerSigns[0].setTitle(Sign.rock.emoji, for: .normal)
            playerSigns[1].setTitle(Sign.paper.emoji, for: .normal)
            playerSigns[2].setTitle(Sign.scissors.emoji, for: .normal)
            }
        case .win: do {
            statusLine.text = "You won!"
            statusSubline.text = "Give me a chance, try again!"
            }
        case .lose: print (currentState)
        case .draw: print (currentState)
        }
    }

    @IBAction func playAgain(_ sender: UIButton) {
        updateState(for: .start)
    }
    
    @IBAction func signThrow(_ sender: UIButton) {
        
    }
    
}

