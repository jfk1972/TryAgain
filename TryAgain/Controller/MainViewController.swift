//
//  ViewController.swift
//  TryAgain
//
//  Created by Joseph Knight on 2/16/24.
//

import UIKit

import AVFoundation
import AudioToolbox

//thsse globalvariables are used to populate the gameOver labels
var yourScore = 1
var totalQuestions = 1


class MainViewController: UIViewController {
    
    // @IBOutlet weak var questionLabel: UILabel!
    // @IBOutlet weak var progressBar: UIProgressView!
    
    //Added another button and a corroponding outlet.
    // @IBOutlet weak var choice1: UIButton!
    // @IBOutlet weak var choice2: UIButton!
    // @IBOutlet weak var choice3: UIButton!
    
    // @IBOutlet weak var scoreLabel: UILabel!
    // @IBOutlet weak var scoreLabel2: UILabel!
    // @IBOutlet weak var gameOverLabel: UILabel!
    
    var quizEngine = QuizEngine()
    var timerInterval = 1.5
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        updateUI()
    }

    
    

    //New button needs to be linked to this IBAction too.
    // @IBAction func answerButtonPressed(_ sender: UIButton)
    {
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizEngine.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight
        {
            AudioServicesPlaySystemSound(SystemSoundID(1334))
           //1322 1021 1028 1326 1334
            
            sender.backgroundColor = UIColor.green
            timerInterval = 1.5
            questionLabel.text = "Correct"
        } else
        {
            AudioServicesPlaySystemSound(SystemSoundID(1024))
            sender.backgroundColor = UIColor.red
            timerInterval = 3.0
            questionLabel.text = "Sorry, that is not correct. \n\nThe correct answer is \(quizEngine.getCorrectAnswer())"
        }
        
        if quizEngine.questionNumber + 1 == quizEngine.quiz.count {
            timerInterval = 4.5
        }
        
        quizEngine.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: timerInterval, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI()
    {
        questionLabel.text = quizEngine.getQuestionText()
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizEngine.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        progressBar.progress = quizEngine.getProgress()
        scoreLabel.text = "Score: \(quizEngine.getScore())"
        scoreLabel2.text = "Question  \(quizEngine.questionNumber)  of  \(quizEngine.quiz.count-1)"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        choice3.backgroundColor = UIColor.clear
        

        
        //these variables may be used in the future to show the users their score
//        yourScore = Int("\(quizEngine.getScore())")!
//        totalQuestions = Int("\(quizEngine.quiz.count)")!
    }
   
//    func notifyUser(title: String, message: String, fromController: MainViewController) -> Void{
//        let alert = UIAlertController(title: "Game Over",
//        message: " You scored \(yourScore) out of \(totalQuestions)",
//        preferredStyle: UIAlertController.Style.alert)
//
//    let cancelAction = UIAlertAction(title: "Play Again?",
//                                     style: .cancel, handler: nil)
//
//    alert.addAction(cancelAction)
//        fromController.present(alert, animated: true,
//        completion: nil)
//    }
    
}




//
//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//
//
//}

