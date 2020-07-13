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
    @IBOutlet weak var playAgainButton: UIButton!
    
    func updateState (for currentState: Game.GameState) {
        switch currentState {
        case .start: do {
            // TODO: make a loop and independent of Sign count
            playerSigns[0].setTitle(Sign.allCases[0].emoji, for: .normal)
            playerSigns[1].setTitle(Sign.allCases[1].emoji, for: .normal)
            playerSigns[2].setTitle(Sign.allCases[2].emoji, for: .normal)
            botChoice.text = botFace
            statusLine.text = "Rock, Paper, Scissors"
            statusSubline.text = "Choose your sign"
            playAgainButton.isHidden = true
            return
            }
        case .win: do {
            statusLine.text = "You won!"
            statusSubline.text = "Give me a chance, try again!"
            }
        case .lose: do {
           statusLine.text = "You loose!"
           statusSubline.text = "Let try again!"
           }
        case .draw: do {
          statusLine.text = "Hm, it's a draw!"
          statusSubline.text = "Let try again!"
          }
        }
        botChoice.text = game.botSign.emoji
        playAgainButton.isHidden = false
    }

    @IBAction func playAgain(_ sender: UIButton) {
        updateState(for: .start)
    }
    
    @IBAction func signThrow(_ sender: UIButton) {
  
        game.state = game.gameResult(bot: randomSign(), player: getSignByEmoji(sender.currentTitle!)) //TODO: to make proper unwrap unwrap
        updateState(for: game.state)

    }
    
}

