//
//  ResultViewController.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 05/12/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var screen: ResultView?
    private let result: String
    private let numberOfPeople: String
    private let percentTip: String
    
    init(result: String, numberOfPeople: String, percentTip: String) {
        self.result = result
        self.numberOfPeople = numberOfPeople
        self.percentTip = percentTip
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        signProtocols()
        updateScreen()
    }
    
    private func signProtocols() {
        screen?.delegate(delegate: self)
    }
    
    private func updateScreen() {
        screen?.totalNumberLabel.text = result
        screen?.descriptionLabel.text = "Split between \(numberOfPeople) people, with \(percentTip) tip"
    }
}

extension ResultViewController: ResultViewProtocol {
    func tappedRecalculateButton() {
        dismiss(animated: true)
    }
}
