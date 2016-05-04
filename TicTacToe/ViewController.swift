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
    
    var numberOfMovesPlayed = 0
    var gameBoard = [
        [0,0,0],
        [0,0,0],
        [0,0,0],
    ]
    
    var playerID: Int = 0
    
    @IBAction func ticTacAction(sender: UIButton) {
        self.numberOfMovesPlayed += 1
        var validMove = false
        
        if sender.tag < 4 && (gameBoard[0][sender.tag - 1] == 0) {
            gameBoard[0][sender.tag - 1] = playerID
            validMove = true
            print(gameBoard)
        }
        else if sender.tag < 7 && (gameBoard[0][sender.tag - 1] == 0) {
            gameBoard[1][sender.tag - 4] = playerID
            validMove = true
            print(gameBoard)
        }
        else if (gameBoard[0][sender.tag - 1] == 0) {
            gameBoard[2][sender.tag - 7] = playerID
            validMove = true
            print(gameBoard)
        }
        
        if validMove == true {
            if numberOfMovesPlayed % 2 != 0 {
                //          first player == red
                playerID = 1
                sender.backgroundColor = UIColor.redColor()
                validMove = false
            }
            else {
                //          second player == blue
                playerID = 2
                sender.backgroundColor = UIColor.blueColor()
                validMove = false
            }
        }
    }
    
        


    override func viewDidLoad() {
        super.viewDidLoad()
        for button in ticTacButton  {
            button.backgroundColor = UIColor.lightGrayColor()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

