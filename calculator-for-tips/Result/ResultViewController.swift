//
//  ResultViewController.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 05/12/2023.
//

import UIKit

class ResultViewController: UIViewController {
    
    private var screen: ResultView?
    
    override func loadView() {
        screen = ResultView()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
