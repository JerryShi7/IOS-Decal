//
//  HangmanViewController.swift
//  Hangman
//
//  Created by 石济 on 9/28/17.
//  Copyright © 2017 iOS DeCal. All rights reserved.
//

import UIKit
import Foundation

class HangmanViewController: UIViewController {


    
    var randomPhrase: String?
    var wrongGuesses = Set<String>()
    var wrongsNum = 0
    var phraseArray: [Character]?
    var phraseLength : Int?
    var correctPos: [Bool]?
    var letters = Set<String>()
    
    @IBOutlet weak var word: UILabel!
    @IBOutlet weak var guess: UIButton!
    @IBOutlet weak var wrongGuessesList: UILabel!
    @IBOutlet weak var userInput: UITextField!
    @IBOutlet weak var hangmanImage: UIImageView!
    @IBOutlet weak var alertSignalChar: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generatedPhrases = HangmanPhrases()
        randomPhrase = generatedPhrases.getRandomPhrase()
        phraseArray = [Character](randomPhrase!.characters)
        phraseLength = randomPhrase?.characters.count
        correctPos = [Bool](repeating: false, count: phraseLength!)
        for letter in phraseArray!{
            letters.insert(String(letter))
        }
        for index in 0...phraseLength! - 1 {
            if String(phraseArray![index]) == " " {
                correctPos![index] = true
            }
        }
        showGuess()
    }
         //Do any additional setup after loading the view.

    func showGuess() {
        word.text = ""
        for index in 0...phraseLength! - 1 {
            if correctPos![index] {
                word.text?.append(String(phraseArray![index]) + " ")
            } else {
                word.text = word.text! + "_ "
            }
        }
    }

    @IBAction func makeAGuess(_ sender: UIButton) {
        let guess = userInput.text?.uppercased()

        if guess!.characters.count == 1 {

            alertSignalChar.text = "Please put your letter here:"
            
            if letters.contains(guess!) {
                for index in 0...phraseLength!-1 {
                    if guess == String(phraseArray![index]) {
                        correctPos![index] = true
                    }
                }
                
                let hangmanGame = HangmanGame()
                if hangmanGame.isWin(_positions: correctPos!) {
                    let alertController = UIAlertController(
                        title: "Congratulations! You won!",
                        message: "Do you want to start a new game?",
                        preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style:.default) {
                        action in self.reset()})
                    self.present(alertController, animated: true, completion: nil)
                }
            } else {
                if !wrongGuesses.contains(String(guess!)) {
                    wrongGuesses.insert(String(guess!))
                    wrongsNum += 1
                    let imageNmae = "hangman" + String(wrongsNum + 1) + ".gif"
                    hangmanImage.image = UIImage(named:imageNmae)
                    if wrongsNum > 5 {
                        let alertController = UIAlertController(
                            title: "Game Over",
                            message: "Try again?",
                            preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "OK", style: .default) {
                            action in self.reset()})
                        self.present(alertController, animated: true, completion: nil)
                    }
                    wrongGuessesList.text = String(describing: wrongGuesses)
                }
            }
            showGuess()
        } else {
           alertSignalChar.text = "Only one charcter needed."
           showGuess()
        }
        userInput.text = ""
    }

    @IBAction func restartGame(_ sender: UIButton) {
        reset()
    }
    

    func reset() {
        word.text = ""
        wrongsNum = 0
        let hangmanPhrasees = HangmanPhrases()
        phraseLength = self.randomPhrase!.characters.count
        correctPos = [Bool](repeating: false, count: self.phraseLength!)
        letters = Set<String>()
        wrongGuesses = Set<String>()
        randomPhrase = hangmanPhrasees.getRandomPhrase()
        phraseArray = [Character](self.randomPhrase!.characters)
        for letter in self.phraseArray! {
            letters.insert(String(letter))
        }
        hangmanImage.image = UIImage(named: "hangman1.gif")
        alertSignalChar.text = "Please put your letter here:"
        wrongGuessesList.text = ""
        showGuess()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */
}
