//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var otherButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain() // create a new instance of the QuizBrain Class
    
// MARK: View did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
//DONT NEED TO SET HERE AS UPDATE UI CALL IT ANYWAY
//        falseButton.setTitle("\(quizBrain.getChoiceOne())", for: UIControl.State.normal)
//        trueButton.setTitle("\(quizBrain.getChoiceTwo())", for: UIControl.State.normal)
//        otherButton.setTitle("\(quizBrain.getChoiceThree())", for: UIControl.State.normal)
        progressBar.setProgress( 0.0, animated: true)
    }
    

// MARK: Button pressed
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True / False / Other
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight { //doesnt require == boolean as it knows it type BOOL
            print("Right!")
            sender.backgroundColor = UIColor.green
            scoreLabel.text = "Score: \(quizBrain.getScore())"
        } else {
            print("Wrong!")
            scoreLabel.text = "Score: \(quizBrain.getScore())"
            sender.backgroundColor = UIColor.red
        }

// MARK: Next Question
        
        quizBrain.nextQuestion()
        
        //Shortcode Timer
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {_ in
            self.updateUI()
            
        }
        
    }
    
// MARK: Update UI
    
    func updateUI(){
         
        //update buttons to hold correct answer - ANGELA CODE
        //ass all array choices returned you call the MCQ answer number you want here instead
        let answerChoices = quizBrain.getAnswers()
        falseButton.setTitle(answerChoices[0], for: .normal)
        trueButton.setTitle(answerChoices[1], for: .normal)
        otherButton.setTitle(answerChoices[2], for: .normal)
        
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        otherButton.backgroundColor = UIColor.clear
    
        //update buttons to hold correct answer - ANT CODE
//        falseButton.setTitle("\(quizBrain.getChoiceOne())", for: UIControl.State.normal)
//        trueButton.setTitle("\(quizBrain.getChoiceTwo())", for: UIControl.State.normal)
//        otherButton.setTitle("\(quizBrain.getChoiceThree())", for: UIControl.State.normal)
    }
    
}

