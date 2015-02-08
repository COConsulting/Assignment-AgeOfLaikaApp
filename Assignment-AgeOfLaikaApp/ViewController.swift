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
    @IBOutlet weak var convertAgainButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorNameLabel: UILabel!
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
        
//      Check for input, if none, report error, otherwise continue.
        if(enterDogAgeHumanYrs.text=="" || enterDogName.text==""){
            
//          Reset all error messages incase a person makes an error, fixes one but not the other.
            errorNameLabel.hidden=true
            errorMessageLabel.hidden=true
            
            
//          Unhide error message and error corresponding label near correct input box(es)
            
            errorMessage.hidden=false
            
            if(enterDogName.text==""){
                errorNameLabel.hidden=false
            }
            if(enterDogAgeHumanYrs.text==""){
                errorMessageLabel.hidden=false
            }
            
        }else{
            
//          Make sure that the error message and label are hidden.
            errorMessageLabel.hidden=true
            errorNameLabel.hidden=true
            errorMessage.hidden=true
        
//          Setup a new variable to equal the inputed human years and multiply that by 7
            var dogAgeDogYrs = (enterDogAgeHumanYrs.text.toInt()! * 7)
        
//          Change Converted Age Label to being the calculated Age
            convertedDogAge.text = "Your dog, "+enterDogName.text+", is \(dogAgeDogYrs) in Dog years."

//          Hide Input boxs and button
            enterDogAgeHumanYrs.hidden=true
            enterDogName.hidden=true
            convertToDogYrsButton.hidden=true
        
//          Show the result by unhiding the Converted Age Label and the convert again button
            convertedDogAge.hidden=false
            convertAgainButton.hidden=false

//          CLEAN UP THE UI ELEMENTS
//          Hide keyboard
            enterDogAgeHumanYrs.resignFirstResponder()
            
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
        
    }
}

