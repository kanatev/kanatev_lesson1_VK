//
//  NewslineViewController.swift
//  myVK
//
//  Created by AlexMacPro on 08/01/2019.
//  Copyright © 2019 AlexMacPro. All rights reserved.
//

import UIKit

class NewslineViewController: UIViewController {
  
    @IBOutlet weak var viewLikeControl: LikeControl!
    
    @IBAction func exitToFirstScreenButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
