//
//  ViewController.swift
//  Images
//
//  Created by Artem Karmaz on 2/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    fileprivate func createSignInSignOutButtons() {
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.gray.cgColor
        signInButton.layer.cornerRadius = 10
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(signInButtonPressed(sender:)), for: .touchDown)
        signInButton.addTarget(self, action: #selector(signInButtonTyped(sender:)), for: .touchUpInside)
        
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.gray.cgColor
        signUpButton.layer.cornerRadius = 10
        signUpButton.clipsToBounds = true
        signUpButton.addTarget(self, action: #selector(signUpButtonPressed(sender:)), for: .touchDown)
        signUpButton.addTarget(self, action: #selector(signUpButtonTyped(sender:)), for: .touchUpInside)
    }
    
    fileprivate func showLoginButton(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 0.9, options: .transitionCrossDissolve, animations: {
            self.signInButton.isHidden = hidden
        })
    }
    
    @objc func signInButtonPressed(sender: UIButton) {
        signInButton.backgroundColor = .white
    }
    
    @objc func signInButtonTyped(sender: UIButton) {
        signInButton.backgroundColor = UIColor.lightGray
    }
    
    @objc func signUpButtonPressed(sender: UIButton) {
        signUpButton.backgroundColor = .white
    }
    
    @objc func signUpButtonTyped(sender: UIButton) {
        signUpButton.backgroundColor = UIColor.lightGray
    }

    var someProperties: String? {
        didSet {
            signInButton.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSignInSignOutButtons()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showLoginButton(view: signInButton, hidden: false)

    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

    @IBAction func signInButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.signInButton.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.signInButton.transform = CGAffineTransform.identity
                        }
        })
    }
    
    @IBAction func signUpButtonAction(_ sender: UIButton) {
        UIView.animate(withDuration: 0.6,
                       animations: {
                        self.signUpButton.transform = CGAffineTransform(scaleX: 0.96, y: 0.96)
        },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            self.signUpButton.transform = CGAffineTransform.identity
                        }
        })
    }
    

}
