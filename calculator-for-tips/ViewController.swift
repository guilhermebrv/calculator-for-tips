//
//  ViewController.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    public var screen: View?
    private var viewModel: ViewModel = ViewModel()
    
    override func loadView() {
        screen = View()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signProtocols()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
    }
}

extension ViewController: ViewProtocol {
    func tappedPercentButton(_ sender: UIButton) {
        sender.isSelected = true
        if viewModel.checkIfButtonIsSelected(button: sender) {
            resetButtonBgColors()
            sender.isSelected = true
            sender.configuration?.baseBackgroundColor = .systemGreen.withAlphaComponent(0.5)
            validateFields()
        }
    }
    func tappedStepper(_ sender: UIStepper) {
        screen?.splitNumberLabel.text = String(Int(sender.value))
        validateFields()
    }
}

extension ViewController {
    public func resetButtonBgColors() {
        screen?.zeroPctButton.configuration?.baseBackgroundColor = .clear
        screen?.tenPctButton.configuration?.baseBackgroundColor = .clear
        screen?.twentyPctButton.configuration?.baseBackgroundColor = .clear
    }
    public func validateFields() {
        if let textField = screen?.billTextField, let tip1 = screen?.zeroPctButton, let tip2 = screen?.tenPctButton, let tip3 = screen?.twentyPctButton {
            if viewModel.checkIfFieldsAreFilled(textField, tip1, tip2, tip3) {
                screen?.calculateButton.isEnabled = true
            } else {
                screen?.calculateButton.isEnabled = false
            }
        }
    }
}
