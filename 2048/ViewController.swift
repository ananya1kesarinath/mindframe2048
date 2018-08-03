//
//  ViewController.swift
//  2048
//
//  Created by Student on 8/1/18.
//  Copyright © 2018 Student. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    var board = [[0,0,0,0],
                 [0,0,0,0],
                 [2,2,2,2],
                 [0,0,0,0]]
    
    func printBoard() {
        var buffer: String = ""
        for row in 0...3{
            for col in 0...3{
            buffer += String(board[row][col]) + " " // our string + new number + a space
            }
        buffer += "\n" //a new line character (it's an enter)
        }
        myLabel.text = buffer
}

    override func viewDidLoad() {
        super.viewDidLoad()
            }

    @IBAction func hide(sender: AnyObject) {
    /*
 myLabel.text = "HelloWorld!"
 */
        myLabel.isHidden=true
    }
    @IBAction func addToBoard(sender: AnyObject) {
        var empty = 0
        for k in 0...15 {
            if board [k/4] [k%4] == 0{ //if spot is not empty
                empty += 1
            }
        }
        print (empty)
        
        let placement = arc4random_uniform(UInt32(empty))
        print(placement)
        
        var count = 0
        for k in 0...15{
            if board[k/4] [k%4] == 0{ // if spot is empty
            if UInt32(count) == placement {
                board[k/4] [k%4] = 2
                break 
            }
                count += 1
            }
        }
        printBoard ()
    }
   //helper function collapse numbers
    func collapses(direction: Int) {
        if direction == 0{ // down
            for col in 0...3{
                for i in 1...3{ // i for increment
                    for row in i...3{ // from
                        if board[row][col] == 0{ //if row below == 0
                            // set element to above
                            board[row][col] = 0 //if row below == 0
                                //set element to above
                                board[row][col] = board [row-1][col]
                                board[row-1] [col] = 0 // set above to 0
                            }
                        }
                    }
                }
            }
    }
}
