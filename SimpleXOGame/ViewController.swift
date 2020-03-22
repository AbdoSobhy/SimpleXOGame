//
//  ViewController.swift
//  SimpleXOGame
//
//  Created by Karim Ebrahem on 3/21/20.
//  Copyright © 2020 Karim Ebrahem. All rights reserved.
//

import UIKit

enum Player {
    case one //  X -> 1
    case two  // O -> 2
}


class ViewController: UIViewController {
    
    @IBOutlet private var gameBoardButtons: [UIButton]!
    
    var currentPlayer: Player = .one
    var gameBoardState = [0, 0, 0,
                          0, 0, 0,
                          0, 0, 0]

    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
                               [0, 3, 6], [1, 4, 7], [2, 5, 8],
                               [0, 4, 8], [2, 4, 6]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func plays(_ sunder: UIButton) {
        currentPlayerPlay(sunder)
        updateGameBoardState(sunder)
        checkForWinner()
    }
    
    @IBAction func resetFunc(_ sender: UIButton) {
        reset()
    }
    private func checkForWinner() {
        
        for combination in winningCombinations {
            if gameBoardState[combination[0]] != 0 &&
                gameBoardState[combination[0]] == gameBoardState[combination[1]] && gameBoardState[combination[1]] == gameBoardState[combination[2]]
            {
            if gameBoardState[combination[0]] == 1 {
            
                
                    print("X is winner®")
                print(combination)
                print(gameBoardState)
                reset()
            
                    // in Alert Action Reset the Game
                } else if  gameBoardState[combination[0]] == 2{
                
                    print("O is winner®")
                print(combination)
                print(gameBoardState)
                reset()


            
                    // in Alert Action Reset the Game
            } else if gameBoardState[combination[0]] != 1 && gameBoardState[combination[0]] != 2
            {
                
                print("drow")
                print(gameBoardState)
                reset()

                
            }
        }
        }

    }
    private func currentPlayerPlay(_ sunder: UIButton) {
        switch currentPlayer {
        case .one:
            sunder.setTitle("X", for: .normal)
            currentPlayer = .two
        case .two:
            sunder.setTitle("O", for: .normal)
            currentPlayer = .one
        }
        sunder.isEnabled = false
    }
    
    private func updateGameBoardState(_ sunder: UIButton) {
        let currnetPlayerButtonIndex = sunder.tag
        
//                gameBoardState[currnetPlayerButtonIndex] = sunder.titleLabel?.text == "X" ? 1 : 2
                
                if sunder.titleLabel?.text == "X" {
                    gameBoardState[currnetPlayerButtonIndex] = 1
                } else {
                    gameBoardState[currnetPlayerButtonIndex] = 2
                }

    }
    private func reset() {

      gameBoardState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        currentPlayer = .one
        for button in gameBoardButtons {
            button.setTitle(" ", for: .normal)
            button.isEnabled = true

            
            
        }
    }
}
