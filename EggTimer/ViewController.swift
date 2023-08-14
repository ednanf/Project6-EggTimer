//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
// Modified by Ednan R. Frizzera Filho on 13/08/2023.
//

import UIKit

class ViewController: UIViewController {
// MARK: - PROPERTIES
    let eggTimes = ["Soft": 300, "Medium": 42, "Hard": 720] // time in seconds
    var secondsRemaining = 60
    var timer = Timer()

// MARK: - IBACTIONS
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() // ensures the timer stops before starting a new one
        
        let hardness = sender.currentTitle!
        
        secondsRemaining = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(
                        timeInterval: 1.0, // in seconds
                        target: self,
                        selector: #selector(updateTimer),
                        userInfo: nil,
                        repeats: true
                )
    }
    
    @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }
    }
    
}
