//
//  MainTableViewController.swift
//  Images
//
//  Created by Artem Karmaz on 2/19/19.
//  Copyright © 2019 Johansson Group. All rights reserved.
//

import UIKit



class MainTableViewController: UITableViewController {
    
    enum Segue {
        static let openImageVC = "openImage"
    }
    
    var storage = Storage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return storage.headlines.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.selectionStyle = .blue
        cell.accessoryType = .disclosureIndicator
        
        let headline = storage.headlines[indexPath.row]
        let font = UIFont.preferredFont(forTextStyle: .headline)
        let textColor = UIColor(red: 0.175, green: 0.458, blue: 0.831, alpha: 1.0)
        let attributes: [NSAttributedString.Key: Any] = [.foregroundColor: textColor, .font: font, .textEffect: NSAttributedString.TextEffectStyle.letterpressStyle]
        let attributedStringTextLabel = NSAttributedString(string: headline.title, attributes: attributes)
        let attributedStringDetailTextLabel = NSAttributedString(string: headline.text, attributes: attributes)
        
        cell.textLabel?.attributedText = attributedStringTextLabel
        cell.detailTextLabel?.attributedText = attributedStringDetailTextLabel
        
        let myImage = UIImage(named: headline.image)?.roundedImage
        cell.imageView?.image = myImage
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = storage.headlines[sourceIndexPath.row]
        storage.headlines.remove(at: sourceIndexPath.row)
        storage.headlines.insert(movedObject, at: destinationIndexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let imageVC = segue.destination as? ImageViewController else { return }
        
        if Segue.openImageVC == segue.identifier {
            if let path = tableView.indexPathForSelectedRow {
                imageVC.image = storage.headlines[path.row]
            }
        }
    }
    
    @IBAction func quitButtonAction(_ sender: UIBarButtonItem) {
        let storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let main = storyboard.instantiateViewController(withIdentifier: "Main") as! IntroViewController
        self.present(main, animated: true, completion: nil)
    }
}

extension UIImage{
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
