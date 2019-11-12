//
//  FeedTableViewCell.swift
//  GorillaBook
//
//  Created by Christian Collazos on 11/11/19.
//  Copyright © 2019 Christian Collazos. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var bodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(feed : Feed){
        self.nameLbl.text = feed.first_name
        self.bodyLbl.text = feed.post_body
    }
    
}
