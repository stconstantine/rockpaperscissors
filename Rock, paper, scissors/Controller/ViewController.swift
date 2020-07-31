//
//  ViewController.swift
//  Rock, paper, scissors
//
//  Created by Константин Стародубцев on 13.07.2020.
//  Copyright © 2020 Константин Стародубцев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game = Game(botSign: Sign(emoji: botChoice.text ?? ""), playerSign: Sign(emoji: playerChoice.text ?? ""))

    override func viewDidLoad() {
        super.viewDidLoad()
        updateState(for: .start)
      }
      
    @IBOutlet weak var botChoice: UILabel!
    @IBOutlet weak var botFace: UILabel!
    @IBOutlet weak var playerChoice: UILabel!
    @IBOutlet weak var statusLine: UILabel!
    @IBOutlet weak var statusSubline: UILabel!
    @IBOutlet var playerSigns: [UIButton]!
    @IBOutlet weak var playAgainButton: UIButton!
    
    func updateState (for currentState: Game.GameState) {
        switch currentState {
        case .start: do {
            view.backgroundColor = .systemBackground
            for index in 0..<playerSigns.count {
                playerSigns[index].isHidden = false
                playerSigns[index].setTitle(Sign.allCases[index].emoji, for: .normal)
            }
            playerChoice.isHidden = true
            botChoice.isHidden = true
            botFace.isHidden = false
            statusLine.text = "Rock, Paper, Scissors"
            statusSubline.text = "Choose your sign"
            playAgainButton.isHidden = true
            return
            }
        case .win: do {
            view.backgroundColor = .systemGreen
            statusLine.text = "You won!"
            statusSubline.text = "Give me a chance, try again!"
            }
        case .lose: do {
            view.backgroundColor = .systemRed
            statusLine.text = "You loose!"
            statusSubline.text = "Let try again!"
            }
        case .draw: do {
           view.backgroundColor = .systemYellow
           statusLine.text = "Hm, it's a draw!"
           statusSubline.text = "Let try again!"
           }
        }
        botChoice.text = game.botSign.emoji
        botChoice.isHidden = false
        botFace.isHidden = true
        playAgainButton.isHidden = false
    }
    
    @IBAction func signThrow(_ sender: UIButton) {

        game.botSign = game.randomSign()
        game.playerSign = Sign(emoji: sender.currentTitle ?? "")
        game.state = game.gameResult(bot: game.botSign, player: game.playerSign)
        for index in 0..<playerSigns.count {
            playerSigns[index].isHidden = true
        }
        playerChoice.text = game.playerSign.emoji
        playerChoice.isHidden = false
        updateState(for: game.state)
      }

    @IBAction func playAgain(_ sender: UIButton) {
        updateState(for: .start)
    }
    
}
