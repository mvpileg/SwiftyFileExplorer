//
//  Directory.swift
//  PhoneFit 3-4
//
//  Created by Matthew Pileggi on 12/5/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

class Directory: Item {
    
    let path: String
    
    init(name: String, parentPath: String) {
        self.path = "\(parentPath)/\(name)"
        super.init(name: name)
    }
    
    override func getIcon() -> UIImage? {
        return UIImage(named: "add")
    }

}
