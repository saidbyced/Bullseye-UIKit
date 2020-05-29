//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Chris Eadie on 27/05/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var target: Int = 100
    var sliderValue: Int = 50
    var totalScore: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        randomiseTarget()
    }

    @IBAction func sliderMoved(_ slider: UISlider) {
        sliderValue = Int(round(slider.value))
    }
    
    @IBAction func hitMeButtonPressed() {
        
        let scoreForThisRound = 100 - abs(target - sliderValue)
        
        let alert = UIAlertController(title: "Button pressed", message: "Slider value is \(sliderValue)\nYou scored \(scoreForThisRound) points this round.", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        print("Hit me")
        
        addToTotalScore(scoreForThisRound)
        randomiseTarget()
    }
    
    @IBAction func startOverButtonPressed() {
        print("Start over")
    }
    
    func randomiseTarget() {
        target = Int.random(in: 1...100)
    }
    
    func addToTotalScore(_ scoreForThisRound: Int){
        totalScore += scoreForThisRound
    }
    
}
