//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ant Milner on 18/07/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    //quiz is now a property of the QuizBrain structue
    //we dont need to intialisae it because its already got all the values it needa and we're not going to be adding to it or removing from it 
    
    let quiz = [
        Question(q: "Which is the largest organ in the human body?", c: ["Heart", "Skin", "Large Intestine"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", c: ["25", "50", "100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", c: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", c: ["Chapeau", "Écharpe", "Bonnet"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", c: ["Notebook", "Handkerchief", "Watch"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", c: ["Au Revoir", "Adiós", "Salir"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", c: ["Green", "Orange", "Blue"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", c: ["Rum", "Whisky", "Gin"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", c: ["Panda", "Gorilla", "Crocodile"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", c: ["Indonesia", "Australia", "Scotland"], a: "Australia")

    ]
    
    var questionNumber = 0
    var score = 0
    
    
    //func checkAnswer (answer userAnswer: String)
    //internal username = userAnswer
    /* in this case when we call the function we can give it an "external username" which is "answer"
     so when you call it it looks like this:
     
     func quizBrain.checkAnswer(answer: userAnswer) instead of
     
     quizBrain.checkAnswer(userAnswer: userAnswer)
     
     but, if we make the external username not required by adding an underscore
     
     func quizBrain.checkAnswer(_ userAnswer: userAnswer)
     
     then we can call it like this
     
     quizBrain.checkAnswer(userAnswer)     */

    
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].correctAnswer {
            //user got it right
            score += 1
            print(score)
            return true

        } else {
            //user got it right
            print(score)
            return false

        }
    }
    
     func getScore() -> Int {
        return score
    }
    
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
     func getChoiceOne() -> String {
        return quiz[questionNumber].choice[0]
    }
    
     func getChoiceTwo() -> String {
        return quiz[questionNumber].choice[1]
    }
    
    func getChoiceThree() -> String {
        return quiz[questionNumber].choice[2]
    }
    
    
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
        return progress       
    }
    
    mutating func nextQuestion() { // we have to mutate any function that needs to update a varibale in our struct
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            print("No more Questions!")
            questionNumber = 0
            score = 0
        }
        
    }
}
