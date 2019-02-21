//
//  ImageViewController.swift
//  Images
//
//  Created by Artem Karmaz on 2/21/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
   var storage = Storage()
    var image: Headline?

    @IBOutlet weak var imageTitleName: UINavigationItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageNameLabel: UILabel!
    @IBOutlet weak var imageSubTitileTextView: UITextView!
    

    override func viewWillAppear(_ animated: Bool) {
        imageView.alpha = CGFloat(ImageSettings.alphaImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imageTitleName.title = image?.title
        guard let myImage = UIImage(named: (image?.image)!) else {return}
        imageView.image = myImage.roundedImage
        imageNameLabel.text = image?.title
        imageSubTitileTextView.text = image?.text
    }
}
