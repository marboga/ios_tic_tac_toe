//
//  ViewController.swift
//  TicTacToe
//
//  Created by Michael Arbogast on 5/3/16.
//  Copyright © 2016 Michael Arbogast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var ticTacButton: [UIButton]!
    @IBOutlet weak var victoryLabel: UILabel!
    
    var numberOfMovesPlayed = 1
    var gameBoard = [
        [0,0,0],
        [0,0,0],
        [0,0,0],
    ]
    
    var playerID: Int = 1
    var validMove = true
    
//    var sum = 0
    
    @IBAction func ticTacAction(sender: UIButton) {
        //checks to see if game is already over
        if victoryLabel.hidden == true {
            // if button clicked is in top row (and button is unclicked)
            if sender.tag < 4 && (gameBoard[0][sender.tag - 1] == 0) {
                gameBoard[0][sender.tag - 1] = playerID
                self.validMove = true
                print(sender.tag)
            }
            // if button is in middle row
            else if sender.tag > 3 && sender.tag < 7 && (gameBoard[1][sender.tag - 4] == 0) {
                gameBoard[1][sender.tag - 4] = playerID
                self.validMove = true
                print(sender.tag)
            }
            // if button is in bottom row
            else if sender.tag > 6 && (gameBoard[2][sender.tag - 7] == 0) {
                gameBoard[2][sender.tag - 7] = playerID
                validMove = true
                print(sender.tag)
            }
            else {
                validMove = false
                print("invalid move attempted at button \(sender.tag)")
            }
            
            if validMove == true {
                if numberOfMovesPlayed % 2 != 0 {
    //              first player == red
                    playerID = 1
                    sender.backgroundColor = UIColor.redColor()
                    self.validMove = false
                    print(gameBoard, numberOfMovesPlayed)
                }
                else {
    //              second player == blue
                    playerID = 2
                    sender.backgroundColor = UIColor.blueColor()
                    self.validMove = false
                    print(gameBoard, numberOfMovesPlayed)
                }
                self.numberOfMovesPlayed += 1
            }
            checkForVictor()
        }
    }
    
    func checkForVictor() {
        //there can be no winner until one player has gone 3 times
        if numberOfMovesPlayed > 4 {
            //check across rows
            for row in 0..<gameBoard.count {
                var rowSum: [Int] = []
                for value in gameBoard[row] {
                    rowSum.append(value)
                    print(gameBoard, "numOfPlays=", numberOfMovesPlayed)
                }
                //if blue has 3 in one row
                if rowSum == [1,1,1] {
                    victoryLabel.text = "Blue is the winner!"
                    victoryLabel.hidden = false
                }
                //if red has 3 in one row
                else if rowSum == [2,2,2] {
                    //inform the user
                    victoryLabel.text = "Red is the winner!"
                    victoryLabel.hidden = false
                    for _ in [ticTacButton] {
                        //disable all buttons
                        print("i don't want button")
                    }
                }
            }
            if gameBoard[0][0] == 1 && gameBoard[1][0] == 1 && gameBoard[2][0] == 1 {
                victoryLabel.text = "Blue is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][0] == 2 && gameBoard[1][0] == 2 && gameBoard[2][0] == 2 {
                victoryLabel.text = "Red is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][1] == 1 && gameBoard[1][1] == 1 && gameBoard[2][1] == 1 {
                victoryLabel.text = "Blue is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][1] == 2 && gameBoard[1][1] == 2 && gameBoard[2][1] == 2 {
                victoryLabel.text = "Red is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][2] == 1 && gameBoard[1][2] == 1 && gameBoard[2][2] == 1 {
                victoryLabel.text = "Blue is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][2] == 2 && gameBoard[1][2] == 2 && gameBoard[2][2] == 2 {
                victoryLabel.text = "Red is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][0] == 1 && gameBoard[1][1] == 1 && gameBoard[2][2] == 1 {
                victoryLabel.text = "Blue is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][0] == 2 && gameBoard[1][1] == 2 && gameBoard[2][2] == 2 {
                victoryLabel.text = "Red is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][2] == 1 && gameBoard[1][1] == 1 && gameBoard[2][0] == 1 {
                victoryLabel.text = "Blue is the winner!"
                victoryLabel.hidden = false
            }
            else if gameBoard[0][2] == 2 && gameBoard[1][1] == 2 && gameBoard[2][0] == 2 {
                victoryLabel.text = "Red is the winner!"
                victoryLabel.hidden = false
            }
        }
    }

    @IBAction func resetButton(sender: UIButton) {
        reset()
    }

    func reset() {
        gameBoard = [
            [0,0,0],
            [0,0,0],
            [0,0,0],
        ]
        numberOfMovesPlayed = 0
        playerID = 1
        validMove = true
        victoryLabel.hidden = true
        for button in ticTacButton  {
            button.backgroundColor = UIColor.lightGrayColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

