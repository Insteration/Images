//
//  SignInViewController.swift
//  Images
//
//  Created by Artem Karmaz on 2/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var orTextLabel: UILabel!
    
    fileprivate func createSignInSignOutButtons() {
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.gray.cgColor
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        signUpButton.addTarget(self, action: #selector(signInButtonPressed(sender:)), for: .touchDown)
        signUpButton.addTarget(self, action: #selector(signInButtonTyped(sender:)), for: .touchUpInside)
    }
    
    fileprivate func createLoginPasswordTextFields() {
        loginTextField.layer.cornerRadius = 10
        loginTextField.clipsToBounds = true
        
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.clipsToBounds = true
    }
    
    fileprivate func createAnimationForLoginTextField() {
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.loginTextField.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.loginTextField.transform = CGAffineTransform.identity
                        }
        })
    }
    
    fileprivate func createAnimationForPasswordTextField() {
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.passwordTextField.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.passwordTextField.transform = CGAffineTransform.identity
                        }
        })
    }
    
    fileprivate func createDissmisKeyboardOnTap() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    fileprivate func showLoginTextFieldWithAnimation(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 1.3, options: .transitionCrossDissolve, animations: {
            self.loginTextField.isHidden = hidden
        })
    }
    
    fileprivate func showPasswordTextFieldWithAnimation(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.passwordTextField.isHidden = hidden
        })
    }
    
    fileprivate func showSignUpButtonWithAnimation(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 2.2, options: .transitionCrossDissolve, animations: {
            self.signUpButton.isHidden = hidden
        })
    }
    
    fileprivate func showOrTextLabelWithAnimation(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 2.0, options: .transitionCrossDissolve, animations: {
            self.orTextLabel.isHidden = hidden
        })
    }
    
    private func showAlert(_ titleAlert: String, _ alertMessage: String) {
        let alert = UIAlertController(title: titleAlert,
                                      message: alertMessage,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func signInButtonPressed(sender: UIButton) {
        signUpButton.backgroundColor = .white
    }
    
    @objc func signInButtonTyped(sender: UIButton) {
        signUpButton.backgroundColor = UIColor.lightGray
    }
    
    @objc fileprivate func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSignInSignOutButtons()
        createLoginPasswordTextFields()
        createDissmisKeyboardOnTap()
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showLoginTextFieldWithAnimation(view: loginTextField, hidden: false)
        showSignUpButtonWithAnimation(view: signUpButton, hidden: false)
        showOrTextLabelWithAnimation(view: orTextLabel, hidden: false)
    }
    

    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }

}

extension SignInViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTextField {
            textField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            createAnimationForLoginTextField()
            showPasswordTextFieldWithAnimation(view: passwordTextField, hidden: false)
        } else if textField == passwordTextField {
            createAnimationForPasswordTextField()
            
            if loginTextField.text == "" || passwordTextField.text == "" {
                showAlert("Oops!", "You not input anything!")
            } else {
                 textField.resignFirstResponder()
                showOrTextLabelWithAnimation(view: orTextLabel, hidden: true)
                showSignUpButtonWithAnimation(view: signUpButton, hidden: true)
                showAlert("Correct!", "Welcome to Images")
            }
        }
        return false
    }
}
