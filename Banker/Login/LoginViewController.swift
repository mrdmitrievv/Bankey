//
//  ViewController.swift
//  Banker
//
//  Created by Артём Дмитриев on 24.01.2023.
//

import UIKit

protocol LogoutDelegate: AnyObject {
    func didLogOut()
}

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

class LoginViewController: UIViewController {

    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorLabel = UILabel()
    
    // animation
    let offScreenEdgeConstraint: CGFloat = -1000
    let onScreenEdgeConstraint: CGFloat = 16
    
    var titleLeadingConstraint: NSLayoutConstraint?
    var subtitleLeadingConstraint: NSLayoutConstraint?
    
    weak var delegate: LoginViewControllerDelegate?
    
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }

}

// MARK: - Actions
extension LoginViewController {
    @objc func signInButtonDidPressed(sender: UIButton) {
        errorLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let username = username, let password = password else {
            assertionFailure("Username / password can not be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            showFailure(withMessage: "Username / password can not be blank")
            return
        }
        
        if username == "Q" && password == "1" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin()
            loginView.clearTextField()
        } else {
            showFailure(withMessage: "Incorrect username / password")
        }
        
    }
    
    private func showFailure(withMessage message: String) {
        errorLabel.text = message
        errorLabel.isHidden = false
    }
}

// MARK: - style & layout
extension LoginViewController {
    
    private func style() {
        view.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .largeTitle)
        titleLabel.text = "Bankey"
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textAlignment = .center
        subtitleLabel.adjustsFontForContentSizeCategory = true
        subtitleLabel.numberOfLines = 0
        subtitleLabel.font = .preferredFont(forTextStyle: .title3)
        subtitleLabel.text = "Your premium source for all things banking!"
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign in", for: [])
        signInButton.addTarget(self, action: #selector(signInButtonDidPressed), for: .primaryActionTriggered)
        
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.textColor = .systemRed
        errorLabel.numberOfLines = 0
        errorLabel.textAlignment = .center
        errorLabel.isHidden = false
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorLabel)
        
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 3),
            titleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
        
        titleLeadingConstraint = titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offScreenEdgeConstraint)
        titleLeadingConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalToSystemSpacingBelow: subtitleLabel.bottomAnchor, multiplier: 3),
            subtitleLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        subtitleLeadingConstraint = subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: offScreenEdgeConstraint)
        subtitleLeadingConstraint?.isActive = true
        
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            errorLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
    }
}

extension LoginViewController {
    private func animate() {
        let animator = UIViewPropertyAnimator(duration: 0.75, curve: .easeInOut) {
            self.titleLeadingConstraint?.constant = self.onScreenEdgeConstraint
            self.subtitleLeadingConstraint?.constant = self.onScreenEdgeConstraint
            self.view.layoutIfNeeded()
        }
        
        animator.startAnimation()
    }
}

