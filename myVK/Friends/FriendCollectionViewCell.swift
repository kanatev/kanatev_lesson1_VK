//
//  FriendCollectionViewCell.swift
//  myVK
//
//  Created by AlexMacPro on 25/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    var currentFriend: StructPerson?

    @IBOutlet weak var photoOfFriend: UIImageView!
    
    @IBOutlet weak var nameOfFriend: UILabel!
    
}
