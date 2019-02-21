//
//  Extentsions.swift
//  Images
//
//  Created by Artem Karmaz on 2/21/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit

extension UIImage {
    var roundedImage: UIImage {
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        UIGraphicsBeginImageContextWithOptions(self.size, false, 1)
        UIBezierPath(
            roundedRect: rect,
            cornerRadius: self.size.height
            ).addClip()
        self.draw(in: rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
}
