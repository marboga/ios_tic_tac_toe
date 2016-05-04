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
    
    var numberOfMovesPlayed = 0
    var gameBoard = [
        [0,0,0],
        [0,0,0],
        [0,0,0],
    ]
    
    var playerID: Int = 1
    var validMove = true
    
    var sum = 0
    
    @IBAction func ticTacAction(sender: UIButton) {
        if sender.tag < 4 && (gameBoard[0][sender.tag - 1] == 0) {
            gameBoard[0][sender.tag - 1] = playerID
            self.validMove = true
            print(sender.tag)
        }
        else if sender.tag > 3 && sender.tag < 7 && (gameBoard[1][sender.tag - 4] == 0) {
            gameBoard[1][sender.tag - 4] = playerID
            self.validMove = true
            print(sender.tag)
        }
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
            self.numberOfMovesPlayed += 1
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
        }
        checkForVictor()
    }
    
    func checkForVictor() {
        //check across
        for row in 0..<gameBoard.count {
            var rowSum = []
            print(row, "ROW")
            for value in gameBoard[row] {
                rowSum.append(value)
            }
            if rowSum == [1,1,1] {
                victoryLabel.text = "Blue is the winner!"
                victoryLabel.hidden = false
            }
            else if rowSum == [2,2,2] {
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
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for button in ticTacButton  {
            button.backgroundColor = UIColor.lightGrayColor()
        }
        reset()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

