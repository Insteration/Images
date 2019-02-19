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
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showLoginTextFieldWithAnimation(view: loginTextField, hidden: false)
    }
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
