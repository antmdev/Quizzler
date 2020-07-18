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
    
    
    var quizBrain = QuizBrain() // create a new instance of the QuizBrain Class
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
//        progressBar.setProgress(, animated: true) //set progress back to zero
    }

 
    @IBAction func answerButtonPressed(_ sender: UIButton) {
       
        let userAnswer = sender.currentTitle //True / False
        
        quizBrain.checkAnswer(userAnswer)
                
        
        if userAnswer == actualAnswer {
            print("Right!")
            sender.backgroundColor = UIColor.green
            
        } else {
            print("Wrong!")
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            
            print("No more Questions!")
            questionNumber = 0
        }
        
//Shortcode Timer
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) {_ in
            self.updateUI()
            
            }
 
//Shortcode Timer
//        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    //need objc in front of func if use long form timer
    func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.setProgress(Float(questionNumber + 1) / Float(quiz.count) , animated: true)
        
    }
    
}

