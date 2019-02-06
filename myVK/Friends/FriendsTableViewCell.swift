//
//  FriendsTableViewCell.swift
//  myVK
//
//  Created by AlexMacPro on 25/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

 class FriendsTableViewCell: UITableViewCell {

    @IBOutlet weak var friendsPhoto: UIImageView!
    @IBOutlet weak var friendsLabel: UILabel!

    let borderView: UIView = UIView()
    let photoView: UIImageView = UIImageView()
    
    var tableShadowOpacity: Float {
        get {
            return self.layer.shadowOpacity
        }
        set {
            self.layer.shadowOpacity = newValue
        }
    }
    
    var tableShadowRadius: CGFloat {
        get {
            return self.layer.shadowRadius
        }
        set {
            self.layer.shadowRadius = CGFloat(newValue)
        }
    }
    
    var tableShadowOffset: CGSize {
        get {
            return self.layer.shadowOffset
        }
        set {
            self.layer.shadowOffset = newValue
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        friendsPhoto.backgroundColor = UIColor.clear
        friendsPhoto.layer.shadowColor = UIColor.black.cgColor
        friendsPhoto.layer.shadowOffset = tableShadowOffset
        friendsPhoto.layer.shadowOpacity = tableShadowOpacity
        friendsPhoto.layer.shadowRadius = tableShadowRadius
        
        borderView.frame = friendsPhoto.bounds
        borderView.layer.cornerRadius = 20
        borderView.layer.borderColor = UIColor.black.cgColor
        borderView.layer.borderWidth = 0.1
        borderView.layer.masksToBounds = true
        friendsPhoto.addSubview(borderView)
        
        photoView.frame = borderView.bounds
        borderView.addSubview(photoView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
