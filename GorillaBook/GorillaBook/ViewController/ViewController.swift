//
//  ViewController.swift
//  GorillaBook
//
//  Created by Christian Collazos on 11/11/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var networkManager : NetworkManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkManager = NetworkManager(delegate: self)
        networkManager.requestFeed()
    }


}


extension ViewController : NetworkDelegate {
    func didRetrieveFeed(_ data : [Feed]){
        print(data.count)
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}
