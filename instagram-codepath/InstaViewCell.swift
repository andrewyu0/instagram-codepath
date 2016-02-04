//
//  InstaViewCell.swift
//  instagram-codepath
//
//  Created by Andrew Yu on 2/3/16.
//  Copyright © 2016 Andrew Yu. All rights reserved.
//

import UIKit

class InstaViewCell: UITableViewCell {

    @IBOutlet weak var instaViewCell: UIView!
    @IBOutlet weak var instaView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
