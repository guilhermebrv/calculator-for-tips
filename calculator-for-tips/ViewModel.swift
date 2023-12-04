//
//  ViewModel.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

class ViewModel {
    
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
    
    public func calculateTip() {
        
    }
}
