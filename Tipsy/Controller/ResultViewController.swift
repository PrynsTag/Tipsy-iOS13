//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Prince Carl Velasco on 5/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var splitPerPerson: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var split: Float?
    var numPerson: Int?
    var percent: Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitPerPerson.text = String(format: "%.2f", split ?? 0.00)
        descriptionLabel.text = "Split between \(numPerson ?? 0) people with \(percent ?? 0.00)% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) { dismiss(animated: true, completion: nil) }
}
