//
//  HangmanGame.swift
//  Hangman
//
//  Created by 石济 on 9/28/17.
//  Copyright © 2017 iOS DeCal. All rights reserved.
//

import Foundation

class HangmanGame {
    init() {
        
    }
    public func isWin(_positions: [Bool]) -> Bool{
        for position in (_positions) {
            if (!position) {
                return false
            }
        }
        return true
    }
}
