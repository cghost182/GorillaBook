//
//  ViewController.swift
//  GorillaBook
//
//  Created by Christian Collazos on 11/11/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var feedTable : UITableView!
    
    var networkManager : NetworkManager!
    var feedsArray : [Feed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTable.register(UINib(nibName: "FeedTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "feedCell")
    
        feedTable.dataSource = self
        feedTable.delegate = self
        
        networkManager = NetworkManager(delegate: self)
        networkManager.requestFeed()
    }


}


extension ViewController : NetworkDelegate {
    func didRetrieveFeed(_ data : [Feed]){
        feedsArray = data
        
        DispatchQueue.main.async {
            self.feedTable.reloadData()
        }
        
    }
    
    func didFailWithError(_ error: Error) {
        print(error)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTable.dequeueReusableCell(withIdentifier: "feedCell", for: indexPath) as! FeedTableViewCell
        cell.configureCell(feed:feedsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }
       
   func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
   }
}
