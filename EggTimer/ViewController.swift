//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //The progress bar 
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    //The label that we are going to use to change it to "DONE!"
    @IBOutlet weak var doneLabel: UILabel!
    
    
    //Changed it to seconds and each soft, medium and hard corespond to a time
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    
    var totalTime = 0
    var secondsPassed = 0
    
    //Create a new variable call timer
    var timer = Timer()
    
    //Button for Soft - Medium - Hard
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
    //Stops the timer if we press a new one for example
        timer.invalidate()
        
        //Adding ! means in this case that yes, we are certain that the button view has a title inside of it, hardness is equal to the buttons title inside of it
        
        let hardness = sender.currentTitle!
        
    //The secondsRemaining is = to the eggTimes either soft, medium hard and the title of the thing to figure out which is it should do the count down from
     totalTime = eggTimes[hardness]!
 
    
        progressBar.progress = 0.0
        secondsPassed = 0
        doneLabel.text = hardness
        
        
    //Making a timer for each 1 second and we want it to repeat - //Assining our new timer variable to this function
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
}
    
//We create a function call updateTimer //objective C is a way to call a function to a timer 
@objc func updateTimer() {
            //If the time if greater than 0 it will print the second of it - 1 second each time
            if secondsPassed < totalTime {
                
                
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            


            //If the timer reaches 0 it prints DONE - a else branch branch is needed 
            } else {
                timer.invalidate() 
                doneLabel.text = "DONE!"
                
        }
    }
        
    
}












        
        
        //Switch Statement solution
        
//        switch hardness  {
//        case "Soft":
//            print(softTime)
//        case "medium":
//            print(mediumTime)
//        case "Hard":
//            print(hardTime)
//        default:
//            print("Error")
//        }
        
        
        //Else Statement solution
//        if hardness == "soft" {
//            print(softTime)
//        } else if hardness == "medium" {
//            print(mediumTime)
//        } else {
//            print(hardTime)
//        }

    

