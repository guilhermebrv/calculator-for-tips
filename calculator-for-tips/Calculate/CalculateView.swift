//
//  View.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 04/12/2023.
//

import UIKit

protocol CalculateViewProtocol: AnyObject {
    func tappedPercentButton(_ sender: UIButton)
    func tappedStepper(_ sender: UIStepper)
    func tappedCalculateButton()
}

class CalculateView: UIView {
    
    private weak var delegate: CalculateViewProtocol?
    public func delegate(delegate: CalculateViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var totalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var tipView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        return view
    }()
    
    lazy var enterTotalLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Enter bill total"
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var billTextField: UITextField = {
        let textField = UITextField()
        let attributedString = NSAttributedString(string: "e.g. 123.56", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray.withAlphaComponent(0.5)])
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = attributedString
        textField.textColor = .black
        textField.tintColor = .black
        textField.font = .systemFont(ofSize: 28, weight: .regular)
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }()
    
    lazy var selectTipLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Select tip"
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var zeroPctButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.tinted()
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.baseForegroundColor = .lightGray
        configuration.baseBackgroundColor = .clear
        configuration.attributedTitle = AttributedString("0%", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 30)]))
        button.configuration = configuration
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.addTarget(self, action: #selector(tappedPercentButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedPercentButton(_ sender: UIButton) {
        delegate?.tappedPercentButton(sender)
    }
    
    lazy var tenPctButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.tinted()
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.baseForegroundColor = .lightGray
        configuration.baseBackgroundColor = .clear
        configuration.attributedTitle = AttributedString("10%", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 30)]))
        button.configuration = configuration
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.addTarget(self, action: #selector(tappedPercentButton), for: .touchUpInside)
        return button
    }()
    
    lazy var twentyPctButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        var configuration = UIButton.Configuration.tinted()
        configuration.baseForegroundColor = .lightGray
        configuration.baseBackgroundColor = .clear
        configuration.attributedTitle = AttributedString("20%", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 30)]))
        button.configuration = configuration
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.addTarget(self, action: #selector(tappedPercentButton), for: .touchUpInside)
        return button
    }()
    
    lazy var chooseSplitLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Choose Split"
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var splitView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var splitNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "2"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    
    lazy var increaseSplitStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.translatesAutoresizingMaskIntoConstraints = false
        stepper.minimumValue = 2
        stepper.addTarget(self, action: #selector(tappedStepper), for: .valueChanged)
        return stepper
    }()
    
    @objc public func tappedStepper(_ sender: UIStepper) {
        delegate?.tappedStepper(increaseSplitStepper)
    }
    
    lazy var calculateButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.tinted()
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.baseForegroundColor = .white
        configuration.baseBackgroundColor = .systemGreen
        configuration.attributedTitle = AttributedString("Calculate", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 25, weight: .bold)]))
        button.configuration = configuration
        button.isEnabled = false
        button.addTarget(self, action: #selector(tappedCalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedCalculateButton() {
        delegate?.tappedCalculateButton()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addElements()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        addSubview(totalView)
        totalView.addSubview(enterTotalLabel)
        totalView.addSubview(billTextField)
        totalView.addSubview(tipView)
        tipView.addSubview(selectTipLabel)
        tipView.addSubview(zeroPctButton)
        tipView.addSubview(tenPctButton)
        tipView.addSubview(twentyPctButton)
        tipView.addSubview(chooseSplitLabel)
        tipView.addSubview(splitView)
        splitView.addSubview(splitNumberLabel)
        splitView.addSubview(increaseSplitStepper)
        tipView.addSubview(calculateButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            totalView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            totalView.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalView.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tipView.topAnchor.constraint(equalTo: billTextField.bottomAnchor, constant: 30),
            tipView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tipView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tipView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            enterTotalLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            enterTotalLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            enterTotalLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            billTextField.topAnchor.constraint(equalTo: enterTotalLabel.bottomAnchor, constant: 20),
            billTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            billTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            billTextField.centerXAnchor.constraint(equalTo: centerXAnchor),

            selectTipLabel.topAnchor.constraint(equalTo: tipView.topAnchor, constant: 20),
            selectTipLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            selectTipLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            tenPctButton.topAnchor.constraint(equalTo: selectTipLabel.bottomAnchor, constant: 15),
            tenPctButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            zeroPctButton.trailingAnchor.constraint(equalTo: tenPctButton.leadingAnchor, constant: -30),
            zeroPctButton.topAnchor.constraint(equalTo: tenPctButton.topAnchor),
            
            twentyPctButton.leadingAnchor.constraint(equalTo: tenPctButton.trailingAnchor, constant: 30),
            twentyPctButton.topAnchor.constraint(equalTo: tenPctButton.topAnchor),
            
            chooseSplitLabel.topAnchor.constraint(equalTo: tenPctButton.bottomAnchor, constant: 20),
            chooseSplitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            chooseSplitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            splitView.topAnchor.constraint(equalTo: chooseSplitLabel.bottomAnchor, constant: 15),
            splitView.centerXAnchor.constraint(equalTo: centerXAnchor),
            splitView.heightAnchor.constraint(equalToConstant: 80),
            splitView.widthAnchor.constraint(equalToConstant: 160),
            
            splitNumberLabel.topAnchor.constraint(equalTo: splitView.topAnchor, constant: 10),
            splitNumberLabel.trailingAnchor.constraint(equalTo: increaseSplitStepper.leadingAnchor, constant: -20),
            
            increaseSplitStepper.trailingAnchor.constraint(equalTo: splitView.trailingAnchor, constant: -10),
            increaseSplitStepper.centerYAnchor.constraint(equalTo: splitNumberLabel.centerYAnchor),
            
            calculateButton.bottomAnchor.constraint(equalTo: totalView.safeAreaLayoutGuide.bottomAnchor),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.heightAnchor.constraint(equalToConstant: 60),
            calculateButton.widthAnchor.constraint(equalToConstant: 180),
        ])
    }
    
}
