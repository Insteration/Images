//
//  SettingsViewController.swift
//  Images
//
//  Created by Artem Karmaz on 2/21/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class ImageSettingsViewController: UITableViewController {

    @IBOutlet weak var imageAnimationSwitch: UISwitch!
    @IBOutlet weak var imageTappingSwitch: UISwitch!
    @IBOutlet weak var imageAlphaSlider: UISlider!
    

    override func viewWillAppear(_ animated: Bool) {
        imageAlphaSlider.value = ImageSettings.alphaImage
        
        if ImageSettings.tappedImage == 1 {
            imageTappingSwitch.isOn = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    
    @IBAction func imageAlphaSliderAction(_ sender: UISlider) {
        ImageSettings.alphaImage = imageAlphaSlider.value
        print("Alpha set up on -- \(ImageSettings.alphaImage)")
    }
    
    @IBAction func imageTappingAction(_ sender: UISwitch) {
        if imageTappingSwitch.isOn {
            ImageSettings.tappedImage = 1
            print("Tapped image is ON - \(ImageSettings.tappedImage)")
        } else {
            ImageSettings.tappedImage = 0
            print("Tapped image is OFF - \(ImageSettings.tappedImage)")
        }
    }
    
}
