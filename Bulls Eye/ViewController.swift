//
//  ViewController.swift
//  Bulls Eye
//
//  Created by Chris Eadie on 01/06/2020.
//  Copyright © 2020 ChrisEadieDesigns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var targetValue = Int.random(in: 1...100)
    let totalScore = 0
    let currentRound = 1
    let roundedSliderValue = 50
    
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var totalScoreLabel: UILabel!
    @IBOutlet weak var currentRoundLabel: UILabel!
    
    @IBAction func sliderMoved() {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
