//
//  DummyViewController.swift
//  Banker
//
//  Created by Артём Дмитриев on 25.01.2023.
//

import UIKit

class DummyViewController: UIViewController {
    
    let stackView = UIStackView()
    let label = UILabel()
    let logOutButton = UIButton(type: .system)
    
    weak var logOutDelegate: LogoutDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
}

extension DummyViewController {
    
    private func style() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        
        logOutButton.translatesAutoresizingMaskIntoConstraints = false
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonPressed), for: .primaryActionTriggered)
        logOutButton.configuration = .filled()
    }
    
    private func layout() {
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logOutButton)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func logOutButtonPressed(_ sender: UIButton) {
        logOutDelegate?.didLogOut()
    }
}
