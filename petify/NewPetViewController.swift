//
//  NewPetViewController.swift
//  petify
//
//  Created by Jose Pol Sastre on 29/9/17.
//  Copyright © 2017 Jose Pol Sastre. All rights reserved.
//

import UIKit

class NewPetViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var imageButton: UIButton!
    
    
    @IBOutlet weak var selectImageImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func selectImageAction(_ sender: Any) {
        let uiImagePickerController: UIImagePickerController = UIImagePickerController()
        
        uiImagePickerController.delegate = self as! UIImagePickerControllerDelegate as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        uiImagePickerController.sourceType = .photoLibrary
        
        self.present(uiImagePickerController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        selectImageImageView.image = info [UIImagePickerControllerOriginalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
