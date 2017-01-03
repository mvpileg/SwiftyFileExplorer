//
//  SwiftyFileExplorerUtility.swift
//  SwiftyFileExplorer
//
//  Created by Matthew Pileggi on 12/7/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

class SwiftyFileExplorerUtility {
    
    public static func getViewController()->UIViewController? {
        let fileExplorerStoryboard = UIStoryboard(name: "FileExplorer", bundle: nil)
        let viewController = fileExplorerStoryboard.instantiateInitialViewController()
    
        //note: bundle may need to be populated when we convert to a framework or a cocoapod

        return viewController
    }
}
