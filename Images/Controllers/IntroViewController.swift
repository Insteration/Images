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
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subHeaderLabel: UILabel!
    

    
    fileprivate func createSignInSignOutButtons() {
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.red.cgColor
        signInButton.layer.cornerRadius = 10
        signInButton.clipsToBounds = true
        signInButton.addTarget(self, action: #selector(signInButtonPressed(sender:)), for: .touchDown)
        signInButton.addTarget(self, action: #selector(signInButtonTyped(sender:)), for: .touchUpInside)
    }
    
    fileprivate func showLoginButton(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 2.0, options: .transitionCrossDissolve, animations: {
            self.signInButton.isHidden = hidden
        })
    }
    
    @objc func signInButtonPressed(sender: UIButton) {
        signInButton.backgroundColor = .white
    }
    
    @objc func signInButtonTyped(sender: UIButton) {
        signInButton.backgroundColor = UIColor.orange
    }

    var someProperties: String? {
        didSet {
            signInButton.isHidden = true
        }
    }
    
    fileprivate func createHeaderLabel() {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.red,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 73)]
            as [NSAttributedString.Key : Any]
        
        headerLabel.attributedText = NSMutableAttributedString(string: "FRUITS!", attributes: strokeTextAttributes)
    }
    
    fileprivate func createSubHeaderLabel() {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.red,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
            as [NSAttributedString.Key : Any]
        
        subHeaderLabel.attributedText = NSMutableAttributedString(string: "Our fruits, your opinion!", attributes: strokeTextAttributes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createSubHeaderLabel()
        createHeaderLabel()
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
    

}
