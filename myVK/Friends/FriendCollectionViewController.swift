//
//  FriendCollectionViewController.swift
//  myVK
//
//  Created by AlexMacPro on 25/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController {

    var currentFriend: StructPerson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of items
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "friendInfo", for: indexPath) as! FriendCollectionViewCell
        
        cell.nameOfFriend.text = currentFriend?.name
//        cell.photoOfFriend.image = currentFriend?.photo
        
        cell.photoOfFriend.backgroundColor = UIColor.clear
        cell.photoOfFriend.layer.shadowColor = UIColor.black.cgColor
        cell.photoOfFriend.layer.shadowOffset = CGSize.zero
        cell.photoOfFriend.layer.shadowOpacity = 1
        cell.photoOfFriend.layer.shadowRadius = 10

        let borderView = UIView(frame: cell.photoOfFriend.bounds)
        borderView.frame = cell.photoOfFriend.bounds
        borderView.layer.cornerRadius = 155
        borderView.layer.borderColor = UIColor.black.cgColor
        borderView.layer.borderWidth = 0.1
        borderView.layer.masksToBounds = true
        cell.photoOfFriend.addSubview(borderView)

        let photoView = UIImageView()
        photoView.image = currentFriend?.photo
        photoView.frame = borderView.bounds
        borderView.addSubview(photoView)
        
        
        


        return cell
    }
}
