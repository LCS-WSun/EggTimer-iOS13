//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

//Adding a audio digital foundation
import AVFoundation

class ViewController: UIViewController {
    
    //making a variable that is connected to the audioplayer
    var player: AVAudioPlayer!
    
    
    //The progress bar -outlet
    @IBOutlet weak var progressBar: UIProgressView!
    
    //The label that we are going to use to change it to "DONE!" - OUtlet
    @IBOutlet weak var doneLabel: UILabel!
    
    //Changed it to seconds and each soft, medium and hard corespond to a time
    let eggTimes = ["Soft": 320, "Medium": 420, "Hard": 720]
    
   
    //This is the the variables before being assigned to the different kind of eggs
    
    //The total time will depend on which egg
    var totalTime = 0
    
    //will add one second each time once it is assigned to a egg
    var secondsPassed = 0
    
    //Create a new variable call timer and is connected to this object called timer
    var timer = Timer()
    
    //Button for Soft - Medium - Hard
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
    //Stops the timer if we press a new one for example - we assigned timer to Timer() object
        timer.invalidate()
        
        //Adding ! means in this case that yes, we are certain that the button view has a title inside of it, hardness is equal to the buttons title inside of it
        
        //Let the hardness = the sender (button and the title it holds soft, medium , hard)
        let hardness = sender.currentTitle!
        
    //The secondsRemaining is = to the eggTimes either soft, medium hard and the title of the thing to figure out which is it should do the count down from
        
//        Force unwrap hardness because we are certain there is always a title stored
     totalTime = eggTimes[hardness]!
 
    
        //this will reset it we a button again
        progressBar.progress = 0.0 //Progress bar is expressed as a float
        secondsPassed = 0
        doneLabel.text = hardness //either Soft, medium or hard
        
        
    //Making a timer for each 1 second and we want it to repeat - //Assining our new timer variable to this function
    timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
}
    
//We create a function call updateTimer //objective C is a way to call a function to a timer 
@objc func updateTimer() {
    
            //If the time if greater than 0, it means that there is still more time left so it will add 1 to itself and it will be in float value because progress bars are expressed like that
            if secondsPassed < totalTime {
            secondsPassed += 1
                
//            The progress bar is equal to the float values of the time passed divided by the total time depending on which egg since we know now at this part
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            

            //If the timer reaches 0 it prints DONE - a else branch branch is needed 
            } else {
                
                //Stop the timer
                timer.invalidate()
                
                //Changing the UI label to DONE
                doneLabel.text = "DONE!"

                
    //Finding the location of the alarm - bundle = disk it is main like it is not background music and it is essential to have in our app, the name of the file is alarm_soun and is a mp3 file, the player which we already made a variable of calls back to the audioplayer and play the contents of this url which we know contains something inside so we put a ! to force unwrap. the player will then play a sound from this url the computer finds it match
                
    let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
    player = try! AVAudioPlayer(contentsOf: url!)
    player.play()
    
            }
    
    }

}










//Previous works with a else statement and switch statement 
        
        
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

    

