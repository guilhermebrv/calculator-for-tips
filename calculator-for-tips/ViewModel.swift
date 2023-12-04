//
//  ViewModel.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

class ViewModel {

    public func checkIfButtonIsSelected(button: UIButton) -> Bool {
        if button.configuration?.baseBackgroundColor == .clear {
            return true
        } else {
            return false
        }
    }
}
