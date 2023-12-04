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
    func tappedZeroButton() {
        if viewModel.checkIfButtonIsSelected(button: screen?.zeroPctButton ?? UIButton()) {
            resetButtonBgColors()
            screen?.zeroPctButton.configuration?.baseBackgroundColor = .systemGreen
        }
    }
    func tappedTenButton() {
        if viewModel.checkIfButtonIsSelected(button: screen?.tenPctButton ?? UIButton()) {
            resetButtonBgColors()
            screen?.tenPctButton.configuration?.baseBackgroundColor = .systemGreen
        }
    }
    func tappedTwentyButton() {
        if viewModel.checkIfButtonIsSelected(button: screen?.twentyPctButton ?? UIButton()) {
            resetButtonBgColors()
            screen?.twentyPctButton.configuration?.baseBackgroundColor = .systemGreen
        }
    }
    func resetButtonBgColors() {
        screen?.zeroPctButton.configuration?.baseBackgroundColor = .clear
        screen?.tenPctButton.configuration?.baseBackgroundColor = .clear
        screen?.twentyPctButton.configuration?.baseBackgroundColor = .clear
    }
}
