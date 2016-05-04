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
    
 
    @IBAction func ticTacAction(sender: UIButton) {
        numberOfMovesPlayed += 1
        if numberOfMovesPlayed % 2 != 0 {
//          first player == red
            let playerColor = "red"
            sender.backgroundColor = UIColor.redColor()
        }
        else {
//          second player == blue
            let playerColor = "blue"
            sender.backgroundColor = UIColor.blueColor()
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

