//
//  ViewController.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var screen: View?
    
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
        <#code#>
    }
    
    func tappedTenButton() {
        <#code#>
    }
    
    func tappedTwentyButton() {
        <#code#>
    }
}
