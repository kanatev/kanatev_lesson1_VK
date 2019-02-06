//
//  Singleton.swift
//  myVK
//
//  Created by AlexMacPro on 06/02/2019.
//  Copyright © 2019 AlexMacPro. All rights reserved.
//

import Foundation

class Session {

    // всегда б такое дз =)
    public static let sessionData = Session()
    
    var token: String = ""
    var userId: Int = 0
}

