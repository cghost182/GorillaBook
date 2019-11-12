//
//  Feed.swift
//  GorillaBook
//
//  Created by Christian Collazos on 11/11/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import Foundation

/***
 {
   "id": 28,
   "first_name": "Anya",
   "last_name": "Mackrill",
   "post_body": "Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.",
   "unix_timestamp": "1532567935",
   "image": "http://dummyimage.com/400x200.png/ff4444/ffffff"
 },
 */


struct Feed : Codable {
    let id : Int
    let first_name : String
    let last_name : String
    let post_body : String?
    let unix_timestamp : String?
    let image : String?
}
