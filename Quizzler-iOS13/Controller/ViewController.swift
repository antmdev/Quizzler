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
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain() // create a new instance of the QuizBrain Class
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! //True / False
        
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
        
        quizBrain.nextQuestion()
        
        
        //Shortcode Timer
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {_ in
            self.updateUI()
            
        }
        
        //Longcode Timer
        //        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
    }
    
    //need objc in front of func if use long form timer
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

