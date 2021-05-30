//
//  TipBrain.swift
//  Tipsy
//
//  Created by Prince Carl Velasco on 5/24/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

struct TipBrain {
    var stepperValue = 2
    
    func calculateTip(_ value: String, _ percent: String, _ numPerson: Double) -> Tip {
        let value = Float(value) ?? 123.56
        let numPerson = Int(numPerson)
        let percent = Float(percent.dropLast())! / 100
        
        let split = Float(value * (1 + percent)) / Float(numPerson)
        return Tip(percent: percent, numPerson: numPerson, split: split)
    }
    
    func getPercent(buttons: [UIButton]) -> String {
        let buttonEnabled  = buttons.filter{ $0.isSelected }
        return buttonEnabled[0].currentTitle!
    }
    
    
}
