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
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        trueButton.layer.cornerRadius = 20.0
        falseButton.layer.cornerRadius = 20.0
        updateUI()
    }
    
    @IBAction func AnswerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        quizBrain.nextQuestion()
        
        if (userGotItRight) {
            print("Right")
            scoreLabel.text = quizBrain.updateScore()
            sender.backgroundColor = UIColor.green
        }else{
            print("Wrong")
            sender.layer.backgroundColor = UIColor.red.cgColor
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestion()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        print("\(quizBrain.questionNumber) : \(quizBrain.score)")
    }
    
}

