//
//  ViewController.swift
//  PhotoFinder
//
//  Created by Akihiro Inui on 03/01/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapButton() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true  // Force to crop selected photo into square
        present(vc, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // If we find "UIImagePickerControllerEditedImage" key in info which type is UIImage, we assign it into imageView class
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            imageView.image = image
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
