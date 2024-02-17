//
//  QuizEngine.swift
//  TryAgain
//
//  Created by Joseph Knight on 2/16/24.
//

import Foundation



import SwiftUI
import UIKit

struct QuizEngine {

    
    

    var score = 0
    var questionNumber = 0
    
    let quiz =
        [
            //New questions
            Question( q: "Who actually carved his initials on the town cannon?", a: ["Tracey Rupert", "Tate Rodenback",  "Tom Rigsby"], correctAnswer: "Tracey Rupert"),
            Question( q: "Thelma Lou’s cousin Karen and Andy shoot crows at?", a: ["Lake Meyers", "the Duck Pond", "Finnegan Flats"], correctAnswer: "Finnegan Flats"),
            Question( q: "What was the name of the loaded goat?", a: ["Sammie", "Billie", "Jimmie"], correctAnswer:  "Jimmie"),
            Question( q: "Who did Opie handcuff to the flagpole?", a: [ "Johnny Paul", "Arnold Winkler", "Ralph Baker"], correctAnswer:  "Ralph Baker"),
            Question( q: "What is the Diner's Friday special?", a:["catfish casserole", "catfish and coleslaw",  "catfish and cornbread"], correctAnswer:  "catfish casserole"),
            Question( q: "Which town wanted Barney to be the new sheriff?", a:[ "Greendale", "Greenville", "Green Valley"], correctAnswer: "Greendale"),
            Question( q: "Which song did the town band practice for the evening concert?", a:["Stars and Stripes", "God Bless America", "The Skater's Waltz"], correctAnswer:  "The Skater's Waltz"),
            
            Question( q: "GAME OVER. \n\n Your score, the number of correct responses out of the total number of questions, is shown above.", a:[ "Play again", "Play again", "Play again"], correctAnswer: "Play again"),
            
            
    ]
    
    func getQuestionText() -> String
    {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String]
    {
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float
    {
        return Float(questionNumber) / Float(quiz.count)
    }
    //here
    mutating func getCorrectAnswer() -> String
    {
        return quiz[questionNumber].rightAnswer }
    
    mutating func getScore() -> Int {
        return score
    }
    // add -> Void for gameOver screen
    mutating func nextQuestion() -> Void
    {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            //future placeholder to show the users their scores
            yourScore = score
            totalQuestions = quiz.count

            // show score code goes here
//
//            MainViewController.notifyUser(title: "a", message: "b", fromController: MainViewController)
//

            // show score code goes here
            
            
            
            
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    
    
    
}
