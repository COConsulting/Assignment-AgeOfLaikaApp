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
    @IBOutlet weak var enterDogAgeHumanYrs: UITextField!
    @IBOutlet weak var convertedDogAge: UILabel!
    
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

//      Hide keyboard
        enterDogAgeHumanYrs.resignFirstResponder()
        
//      Setup a new variable to equal the inputed human years and multiply that by 7
        var dogAgeDogYrs = (enterDogAgeHumanYrs.text.toInt()! * 7)
        
//      Unhide the Converted Age Label
        convertedDogAge.hidden=false
        
//      Change Converted Age Label to being the calculated Age
        convertedDogAge.text = "Your dog is \(dogAgeDogYrs) in Dog years."
        
//      Delete inputed text 
        enterDogAgeHumanYrs.text=""
        
    }
    
}

