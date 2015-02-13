//
//  ViewController.swift
//  Assignment-AgeOfLaikaApp
//
//  Created by Development on 2/7/15.
//  Copyright (c) 2015 COC Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//  Activating Outlets
    @IBOutlet weak var enterDogName: UITextField!
    @IBOutlet weak var enterDogAgeHumanYrs: UITextField!
    @IBOutlet weak var convertedDogAge: UILabel!
    @IBOutlet weak var convertToDogYrsButton: UIButton!
    @IBOutlet weak var convertToRealDogYrsButton: UIButton!
    @IBOutlet weak var convertAgainButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessage: UILabel!
    
//  System set functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//  Activating Button Actions
    @IBAction func convertToDogYrs(sender: UIButton) {
        
        var convertMessage = "Need a Message?"
        
//      Check for input, if none, report error, otherwise continue.
        if(enterDogAgeHumanYrs.text==""){
            
//          Unhide error message and error label near input box
            errorMessage.hidden=false
            errorMessageLabel.hidden=false
            
        }else{
            
//          Make sure that the error message and label are hidden.
            errorMessageLabel.hidden=true
            errorMessage.hidden=true
        
            var dogAgeDogYrsString = enterDogAgeHumanYrs.text
            var dogAgeDogYrsDouble = Double((dogAgeDogYrsString as NSString).doubleValue)

            if (dogAgeDogYrsDouble == 0.0){
                
//              Say that the dog hasn't been born yet.
//              Check for Dog name
                if (enterDogName.text == ""){
                    convertMessage = "Your dog hasn't been born yet."
                }else{
                    convertMessage = enterDogName.text + " hasn't been born yet."
                }
                
            }else{
//              Setup a new variable to equal the inputed human years and multiply that by 7
                dogAgeDogYrsDouble *= 7
            }
            
            if (convertMessage == "Need a Message?"){

//              Check to see if name is inputed
                if(enterDogName.text==""){
//                  Change Converted Age Label to being the calculated Age
                    convertMessage = "Your dog is \(dogAgeDogYrsDouble) in dog years."
                }else{
//                  Change Converted Age Label to being the calculated Age
                    convertMessage = enterDogName.text + " is \(dogAgeDogYrsDouble) in dog years."
                }
            }
            
//          Store converted Text to be displayed
            convertedDogAge.text = convertMessage


//          Hide Input boxes and buttons
            enterDogAgeHumanYrs.hidden=true
            enterDogName.hidden=true
            convertToDogYrsButton.hidden=true
            convertToRealDogYrsButton.hidden=true
        
//          Show the result by unhiding the Converted Age Label and the convert again button
            convertedDogAge.hidden=false
            convertAgainButton.hidden=false

//          CLEAN UP THE UI ELEMENTS
//          Hide keyboards
            enterDogAgeHumanYrs.resignFirstResponder()
            enterDogName.resignFirstResponder()
        }
        
    }
    
    @IBAction func convertToRealDogYrsButtonPressed(sender: UIButton) {
        
        var convertMessage = "Need a Message?"
        
//      Check for input, if none, report error, otherwise continue.
        if(enterDogAgeHumanYrs.text==""){

//          Set errorMessage
            errorMessage.text = "Please enter an age above."
                
//          Unhide error message and error label near input box
            errorMessage.hidden=false
            errorMessageLabel.hidden=false
            
        }else{
            
//          Make sure that the error message and label are hidden.
            errorMessageLabel.hidden=true
            errorMessage.hidden=true
            
//          Setup a new variable to equal the inputed human years
            var dogAgeDogYrsString = enterDogAgeHumanYrs.text
            var dogAgeDogYrsDouble = Double((dogAgeDogYrsString as NSString).doubleValue)
            
//          Multiply the first 2 years by 10.5 and the following years by 4
            if (dogAgeDogYrsDouble == 0.0){

//              Say that the dog hasn't been born yet.
//              Check for Dog name
                if (enterDogName.text == ""){
                    convertMessage = "Your dog hasn't been born yet."
                }else{
                    convertMessage = enterDogName.text + " hasn't been born yet."
                }
                
            }else if(dogAgeDogYrsDouble > 0 && dogAgeDogYrsDouble <= 2){ //Then check to see if the age is between 0 and 2

//  To simplify the code I could have done else if (dogAgeDogYrsDouble > 2) and then flipped what was in this else if statement with what is in the else statement next. But, I choose to keep this way to have a chronological flow of looking for an age of 0, then between 0 and 2 and then above 2.
                
                dogAgeDogYrsDouble *= 10.5
                
            }else{ //Then the age must be over 2
//              Figure out how many years over 2 the dog is. (do 2.0 to make agePart1 a Double)
                var agePart1 = 2.0
                var agePart2 = dogAgeDogYrsDouble - agePart1
                
//              multiply the first 2 years by 10.5 and the remainer of the age by 4
                dogAgeDogYrsDouble = (agePart1*10.5) + (agePart2*4)
                
            }
            
//          Check to see if a message is already made
            if (convertMessage == "Need a Message?"){
                
//              Check to see if name is inputed
                if(enterDogName.text==""){
//                  Change Converted Age Label to being the calculated Age
                    convertMessage = "Your dog is \(dogAgeDogYrsDouble) in real dog years."
                }else{
//                  Change Converted Age Label to being the calculated Age
                    convertMessage = enterDogName.text + " is \(dogAgeDogYrsDouble) in real dog years."
                }
            }
            
//          Store converted Text to be displayed
            convertedDogAge.text = convertMessage
            
//          Hide Input boxes and buttons
            enterDogAgeHumanYrs.hidden=true
            enterDogName.hidden=true
            convertToDogYrsButton.hidden=true
            convertToRealDogYrsButton.hidden=true
            
//          Show the result by unhiding the Converted Age Label and the convert again button
            convertedDogAge.hidden=false
            convertAgainButton.hidden=false
            
//          CLEAN UP THE UI ELEMENTS
//          Hide keyboards
            enterDogAgeHumanYrs.resignFirstResponder()
            enterDogName.resignFirstResponder()
        }
    }
    
    @IBAction func convertAgainButton(sender: UIButton) {

//      Delete previously inputed text
        enterDogName.text=""
        enterDogAgeHumanYrs.text=""
        
//      Hide Converted Age and Convert Again Button
        convertedDogAge.hidden=true
        convertAgainButton.hidden=true
        
//      Unhide input box and inital Convert Button
        enterDogName.hidden=false
        enterDogAgeHumanYrs.hidden=false
        convertToDogYrsButton.hidden=false
        convertToRealDogYrsButton.hidden=false
        
    }
}

