//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//No longer using individual constants
//let softTime = 5
//let mediumTime = 7
//let hardTime = 12
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 12]
    
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        //Adding ! means in this case that yes, we are certain that the button view has a title inside of it
       let hardness = sender.currentTitle!
 
        
//      ! means yes, we are positive there is no spelling error and retirieving the keys will not be a issue
        let result = eggTimes[hardness]!
        
        print(result)
        
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

    

