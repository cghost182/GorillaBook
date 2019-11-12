//
//  CreatePostViewController.swift
//  GorillaBook
//
//  Created by Christian Collazos on 11/11/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit

class CreatePostViewController: UIViewController {

    @IBOutlet weak var postTxt: UITextView!
    @IBOutlet weak var charactersCounter: UILabel!
    @IBOutlet weak var uploadImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureView()
        addInputAccessory()

    }
    
    private func configureView(){
        postTxt.layer.borderWidth = 1
        postTxt.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        postTxt.delegate = self
    }
    
    private func addInputAccessory(){
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "Add Photo", style: .plain, target: self, action: #selector(addPhoto))
        bar.items = [reset]
        bar.sizeToFit()
        postTxt.inputAccessoryView = bar
    }
    
    @objc private func addPhoto(){
       
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {

            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary
            self.present(imagePickerController, animated: true, completion: nil)
        }
        
        postTxt.resignFirstResponder()
        
    }
    
}

extension CreatePostViewController : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let test =  textView.text.count + text.count - range.length
        charactersCounter.text = "\(test) / 150"
        return test < 150
    }
}

extension CreatePostViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        uploadImage.image = image
        self.dismiss(animated: true, completion: nil)
    }
}
