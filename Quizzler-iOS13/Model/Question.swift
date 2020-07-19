//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ant Milner on 17/07/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let choice: Array<String>
    let correctAnswer: String
    
    init(q: String, c:Array<String>, a:String){
        text = q
        choice = c
        correctAnswer = a
    }
    
    
}
