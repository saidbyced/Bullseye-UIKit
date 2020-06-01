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
    
    var targetValue = Int.random(in: 1...100)
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
        targetValue = Int.random(in: 1...100)
        totalScore = 0
        currentRound = 1
        updateLabels()
        roundedSliderValue = 50
        slider.value = Float(roundedSliderValue)
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
