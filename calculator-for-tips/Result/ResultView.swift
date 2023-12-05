//
//  ResultView.swift
//  calculator-for-tips
//
//  Created by Guilherme Viana on 05/12/2023.
//

import UIKit

protocol ResultViewProtocol: AnyObject {
    func tappedRecalculateButton()
}

class ResultView: UIView {
    
    private weak var delegate: ResultViewProtocol?
    public func delegate(delegate: ResultViewProtocol) {
        self.delegate = delegate
    }
    
    lazy var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.1)
        return view
    }()
    
    lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var totalPersonLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Total per person"
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    lazy var totalNumberLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Test"
        label.textAlignment = .center
        label.textColor = .systemGreen.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
        
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Split between 2 people, with 10% tip"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .darkGray.withAlphaComponent(0.8)
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    lazy var recalculateButton: UIButton = {
        let button = UIButton()
        var configuration = UIButton.Configuration.tinted()
        button.translatesAutoresizingMaskIntoConstraints = false
        configuration.baseForegroundColor = .white
        configuration.baseBackgroundColor = .systemGreen
        configuration.attributedTitle = AttributedString("Recalculate", attributes: AttributeContainer([NSAttributedString.Key.font :UIFont.systemFont(ofSize: 25, weight: .bold)]))
        button.configuration = configuration
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        button.addTarget(self, action: #selector(tappedRecalculateButton), for: .touchUpInside)
        return button
    }()
    
    @objc public func tappedRecalculateButton() {
        delegate?.tappedRecalculateButton()
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
        addSubview(topView)
        addSubview(bottomView)
        topView.addSubview(totalPersonLabel)
        topView.addSubview(totalNumberLabel)
        bottomView.addSubview(descriptionLabel)
        bottomView.addSubview(recalculateButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 200),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            totalPersonLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalPersonLabel.centerYAnchor.constraint(equalTo: topView.centerYAnchor),
            totalPersonLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            totalPersonLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            totalNumberLabel.topAnchor.constraint(equalTo: totalPersonLabel.bottomAnchor, constant: 15),
            totalNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            totalNumberLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            descriptionLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            recalculateButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 60),
            recalculateButton.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
    
}
