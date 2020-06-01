//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Chris Eadie on 01/06/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    
    let highestValue = 100
    var targetValue = 0
    var roundedSliderValue = 0
    var totalScore = 0
    var currentRound = 1
    
    
    // MARK: IBOutlets
    
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var currentRoundLabel: UILabel!

    
    // MARK: Override Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()

        startNewGame()
    }
    
    
    // MARK: IBActions
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        roundedSliderValue = Int(slider.value.rounded())
    }
    
    @IBAction func hitMeButtonPressed() {
        print("Hit Me!")
        
        let hitMeAlert = UIAlertController(title: hitMeAlertTitle(), message: hitMeAlertMessage(), preferredStyle: .alert)
        let hitMeAction = UIAlertAction(title: "OK", style: .default, handler: {
            acion in
            self.nextRound()
        })
        
        hitMeAlert.addAction(hitMeAction)
        
        present(hitMeAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOverButtonPressed() {
        print("Start Over")
        startNewGame()
    }
    
    
    // MARK: Methods
    
    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        totalScoreLabel.text = String(totalScore)
        currentRoundLabel.text = String(currentRound)
    }
    
    func startNewGame() {
        targetValue = Int.random(in: 1...highestValue)
        totalScore = 0
        currentRound = 1
        updateLabels()
        roundedSliderValue = 50
        slider.value = Float(roundedSliderValue)
    }
    
    func scoreForRound() -> Int {
        highestValue - abs(targetValue - roundedSliderValue)
    }
    
    func bonusPoints() -> Int {
        switch scoreForRound() {
        case highestValue:
            return highestValue
        case highestValue - 1:
            return highestValue / 2
        default:
            return 0
        }
    }
    
    func hitMeAlertTitle() -> String {
        switch scoreForRound() {
        case highestValue:
            return "Perfect!"
        case (highestValue - 1):
            return "Almost!"
        case (highestValue / 2)...(highestValue - 1):
            return "Not bad"
        default:
            return "Not even close!"
        }
    }
    
    func hitMeAlertMessage() -> String {
        let pluralised = (scoreForRound() == 1) ? "" : "s"
        
        var alertMessage = "The slider is at \(roundedSliderValue)." + "\nYou scored \(scoreForRound()) point\(pluralised) this round"
        
        if bonusPoints() >= (highestValue / 2) {
            alertMessage += "\nplus \(bonusPoints()) bonus points!"
        } else {
            alertMessage += "."
        }
        
        return alertMessage
    }
    
    func nextRound() {
        totalScore += scoreForRound() + bonusPoints()
        targetValue = Int.random(in: 1...highestValue)
        currentRound += 1
        updateLabels()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
