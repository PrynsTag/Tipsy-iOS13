//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var valueLabel: UITextField!
    @IBOutlet weak var zeroTip: UIButton!
    @IBOutlet weak var tenPercentTip: UIButton!
    @IBOutlet weak var twentyPercentTip: UIButton!
    @IBOutlet weak var numOfSplitStepper: UIStepper!
    @IBOutlet weak var numOfSplitVal: UILabel!
    
    var tipBrain = TipBrain()
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    @IBAction func stepperPressed(_ sender: UIStepper) { numOfSplitVal.text = String(format: "%.0f", sender.value) }
    
    @IBAction func tipPressed(_ sender: UIButton) {
        zeroTip.isSelected = false
        tenPercentTip.isSelected = false
        twentyPercentTip.isSelected = false
        
        sender.isSelected = true
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) { performSegue(withIdentifier: "goToResult", sender: self) }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            let buttonEnabled = tipBrain.getPercent(buttons: [zeroTip, tenPercentTip, twentyPercentTip])
            let tip = tipBrain.calculateTip(valueLabel.text!, buttonEnabled, numOfSplitStepper.value)
            
            destinationVC.split = tip.split
            destinationVC.numPerson = tip.numPerson
            destinationVC.percent = tip.percent * 100
        }
    }
}

