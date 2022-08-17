//
//  ViewController.swift
//  RPS
//
//  Created by Administrator on 8/16/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userGuess: UILabel!
    @IBOutlet weak var computerGuess: UILabel!
    @IBOutlet weak var winner: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    enum Guess: String {
        case rock = "Rock"
        case paper = "Paper"
        case scissor = "Scissor"
    }
    
    let guesses: [Guess] = [.rock, .paper, .scissor]
    
    enum Winner: String {
        case user = "You Win !"
        case computer = "Sorry, Computer Wins!"
        case tie = "Tie Game! "
    }
    
    
    
    
    
    @IBAction func userGuess(_ sender: UIButton) {
        let tappedButton = sender.tag
        switch tappedButton {
        
        case 1:
            winner.text = (winnerOfGame(user: .rock, computer: generatedGuess())).rawValue
        case 2:
            winner.text = (winnerOfGame(user: .paper, computer: generatedGuess())).rawValue
        case 3:
            winner.text = (winnerOfGame(user: .scissor, computer: generatedGuess())).rawValue
        default:
            print("I do not know what button was tapped!")
        }
    }
    
    func generatedGuess() -> Guess {
        return guesses.randomElement()!
        
    }
    
    func winnerOfGame(user: Guess, computer: Guess) -> Winner {
        userGuess.text = "You Guessed: \(user.rawValue)"
        
        computerGuess.text = "Computer Guessed: \(computer.rawValue)"
        
        switch user {
        case .rock:
            if computer == .scissor {
                return .user
            } else if computer == .paper {
                return .computer
            }else {
                return .tie
            }
        case .paper:
            if computer == .rock {
                return .user
            } else if computer == .scissor {
                return .computer
            }else {
                return .tie
            }
        case .scissor:
            if computer == .paper {
                return .user
            } else if computer == .rock {
                return .computer
            }else {
                return .tie
            }
        }
        
    }
    
    
    
}

