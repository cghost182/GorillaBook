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
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        configureView()
        addInputAccessory()

    }
    
    private func configureView(){
        postTxt.layer.borderWidth = 1
        postTxt.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    private func addInputAccessory(){
        let bar = UIToolbar()
        let reset = UIBarButtonItem(title: "Add Photo", style: .plain, target: self, action: #selector(addPhoto))
        bar.items = [reset]
        bar.sizeToFit()
        postTxt.inputAccessoryView = bar
    }
    
    @objc private func addPhoto(){
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
