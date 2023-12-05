//
//  CalculateViewController.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

class CalculateViewController: UIViewController {
    
    public var screen: CalculateView?
    private var viewModel: CalculateViewModel = CalculateViewModel()
    private var tipButton: UIButton = UIButton()
    
    override func loadView() {
        screen = CalculateView()
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

extension CalculateViewController: CalculateViewProtocol {
    func tappedCalculateButton() {
        var result = ""
        if let totalBill = screen?.billTextField.text, let percent = tipButton.titleLabel?.text, let people = screen?.splitNumberLabel.text {
            result = viewModel.calculateTip(totalAmount: totalBill, tipPercent: percent, numberOfPeople: people)
        }
        presentModal(result: result)
    }
    
    func tappedPercentButton(_ sender: UIButton) {
        sender.isSelected = true
        if viewModel.checkIfButtonIsSelected(button: sender) {
            tipButton = sender
            resetButtonBgColors()
            sender.configuration?.baseBackgroundColor = .systemGreen.withAlphaComponent(0.5)
            validateFields()
        }
    }
    func tappedStepper(_ sender: UIStepper) {
        screen?.splitNumberLabel.text = String(Int(sender.value))
        validateFields()
    }
}

extension CalculateViewController {
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
    public func presentModal(result: String) {
        let modal = ResultViewController(result: result, numberOfPeople: screen?.splitNumberLabel.text ?? "", percentTip: tipButton.titleLabel?.text ?? "")
        present(modal, animated: true)
    }
}
