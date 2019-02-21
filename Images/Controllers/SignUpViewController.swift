//
//  SignUpViewController.swift
//  Images
//
//  Created by Artem Karmaz on 2/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailPhoneLoginLabel: UILabel!
    @IBOutlet weak var developerButton: UIButton!
    
    
    func showLoginTextFieldWithAnimation(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 1.6, options: .transitionCrossDissolve, animations: {
            self.loginTextField.isHidden = hidden
        })
    }
    
    fileprivate func createEmailPhoneLoginLabel() {
        let strokeTextAttributes = [
            NSAttributedString.Key.strokeColor : UIColor.red,
            NSAttributedString.Key.foregroundColor : UIColor.white,
            NSAttributedString.Key.strokeWidth : -4.0,
            NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 30)]
            as [NSAttributedString.Key : Any]
        
        emailPhoneLoginLabel.attributedText = NSMutableAttributedString(string: "Email, phone, or login", attributes: strokeTextAttributes)
    }
    
    fileprivate func createDeveloperButton() {
        developerButton.layer.borderWidth = 2
        developerButton.layer.borderColor = UIColor.red.cgColor
        developerButton.layer.cornerRadius = 10
        developerButton.clipsToBounds = true
        developerButton.addTarget(self, action: #selector(developerButtonPressed(sender:)), for: .touchDown)
        developerButton.addTarget(self, action: #selector(developerButtonTyped(sender:)), for: .touchUpInside)
    }
    
    @objc func developerButtonPressed(sender: UIButton) {
        developerButton.backgroundColor = .white
    }
    
    @objc func developerButtonTyped(sender: UIButton) {
        developerButton.backgroundColor = UIColor.orange
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDeveloperButton()
        createEmailPhoneLoginLabel()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showLoginTextFieldWithAnimation(view: loginTextField, hidden: false)
    }
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func enterToMainMenuButtonAction(_ sender: UIButton) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let MainTCV = storyboard.instantiateViewController(withIdentifier: "MainTableViewController") as! MainTableViewController
        let navigationController = UINavigationController(rootViewController: MainTCV)
        self.present(navigationController, animated: true, completion: nil)

    }
}
