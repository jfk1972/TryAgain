//
//  Question.swift
//  TryAgain
//
//  Created by Joseph Knight on 2/16/24.
//

import Foundation



import Foundation

struct Question {
    let text: String
   
    //Multiple choice questions array.
    let answers: [String]
    //
    let rightAnswer: String
    
    //The structure initialiser.
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answers = a
        rightAnswer = correctAnswer
    }
}
