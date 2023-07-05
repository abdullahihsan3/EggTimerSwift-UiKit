//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var totalTime:Float = 0
    var secondsPassed:Float = 0
    let eggTimes = ["Soft":3, "Medium": 4, "Hard": 7]
 
    
    @IBOutlet weak var progressOutlet: UIProgressView!
    var timer = Timer()
    @IBOutlet weak var labelOutlet: UILabel!

    @IBAction func hardnessSelected(_ sender: UIButton) {
       secondsPassed = 0
        totalTime = 0
        labelOutlet.text = "How do you want your eggs";
        timer.invalidate()
           
        totalTime = Float(eggTimes[sender.currentTitle!]!);

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
 
    }
    
    
    @objc func updateCounter() {
        var percentageProgressed:Float = 0.0
        //example functionality
        if secondsPassed < totalTime {
      
            percentageProgressed = Float(secondsPassed / totalTime)
            print("Percentage Progress \(percentageProgressed)")
     
        }
        else {
            timer.invalidate()
            labelOutlet.text = "Done"
        }
        progressOutlet.progress = Float(percentageProgressed)
        secondsPassed += 1
    }
}
