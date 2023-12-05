//
//  CalculateViewModel.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

class CalculateViewModel {
    
    public func checkIfButtonIsSelected(button: UIButton) -> Bool {
        if button.isSelected {
            return true
        } else {
            return false
        }
    }
    
    public func checkIfFieldsAreFilled(_ textfield: UITextField, _ tipButton1: UIButton, _ tipButton2: UIButton, _ tipButton3: UIButton) -> Bool {
        if textfield.text != "" && (tipButton1.isSelected || tipButton2.isSelected || tipButton3.isSelected) {
            print("ready text")
            return true
        } else {
            print("not ready")
            return false
        }
    }
    
    public func calculateTip(totalAmount: String, tipPercent: String, numberOfPeople: String) -> String {
        var totalWithTip = 0.0
        let tipValue = tipPercent.replacingOccurrences(of: "%", with: "")
        if let total = Double(totalAmount), let percent = Double(tipValue) {
            totalWithTip = total * (1.0 + (percent / 100.0))
        }
        let valueForEach = totalWithTip / (Double(numberOfPeople) ?? 2.0)
        return String(format: "%.2f", valueForEach)
    }
}
