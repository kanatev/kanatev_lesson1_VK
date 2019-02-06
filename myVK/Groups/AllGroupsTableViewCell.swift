//
//  AllGroupsTableViewCell.swift
//  myVK
//
//  Created by AlexMacPro on 25/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

class AllGroupsTableViewCell: UITableViewCell {

    @IBOutlet weak var photoOfGroup: UIImageView!
    
    @IBOutlet weak var nameOfGroup: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
