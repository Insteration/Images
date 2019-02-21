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
    
    
    
    func showLoginTextFieldWithAnimation(view: UIView, hidden: Bool) {
        UIView.transition(with: view, duration: 1.6, options: .transitionCrossDissolve, animations: {
            self.loginTextField.isHidden = hidden
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
