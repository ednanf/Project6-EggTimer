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
    // MARK: - IBOutlets
    @IBOutlet var textBox: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    
    // MARK: - PROPERTIES
    let eggTimes = ["Soft": 3.0, "Medium": 420.0, "Hard": 720.0] // time in seconds
    var totalTime: Double = 0.0
    var secondsPassed: Double = 0.0
    var timer = Timer()
    
    // MARK: - IBACTIONS
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate() // ensures the timer stops before starting a new one
        textBox.text = "How do you like your eggs?"
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        // reset UI
        progressBar.progress = 0.0
        secondsPassed = 0.0
        textBox.text = hardness
        
        timer = Timer.scheduledTimer(
            timeInterval: 1.0, // in seconds
            target: self,
            selector: #selector(updateTimer),
            userInfo: nil,
            repeats: true
        )
    }
    
    @objc func updateTimer() {
        if secondsPassed <= totalTime {
            let percentageProgress = secondsPassed / totalTime
            progressBar.progress = Float(percentageProgress)
            secondsPassed += 1
        } else {
            timer.invalidate()
            textBox.text = "DONE!"
        }
    }
    
}
