//
//  NetworkManager.swift
//  GorillaBook
//
//  Created by Christian Collazos on 11/11/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import Foundation


protocol NetworkDelegate {
    func didRetrieveFeed(_ data : [Feed])
    func didFailWithError(_ error: Error)
}

final class NetworkManager {
    private var delegate : NetworkDelegate?
    private let feedUrl = "https://gl-endpoint.herokuapp.com/feed"
    
    init (delegate : NetworkDelegate) {
        self.delegate = delegate
    }

    func requestFeed(){
            
        self.runDataTaskForRequest(url : self.feedUrl){ [weak self] (data) in
                self?.handleResponse(data: data)
        }
    }

    private func handleResponse(data: Data) {
        do {
            let feed = try JSONDecoder().decode([Feed].self, from: data)
            delegate?.didRetrieveFeed(feed)
        } catch let error {
            delegate?.didFailWithError(error)
        }
    }
    
    private func runDataTaskForRequest(url : String, completionBlock: @escaping (Data) -> Void) {
        
        let request = URL(string: url)!
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, _, error) in
            if let error = error {
                self?.delegate?.didFailWithError(error)
                return
            }
            
            if let data = data {
                completionBlock(data)
            }

        }.resume()
        
    }
}



