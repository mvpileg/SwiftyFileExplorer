//
//  SwiftyFileExplorerUtility.swift
//  SwiftyFileExplorer
//
//  Created by Matthew Pileggi on 12/7/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

public class SwiftyFileExplorerUtility {
    
    public static func getViewController()->UIViewController? {
        let viewController = storyboard.instantiateInitialViewController()
        return viewController
    }
    
    static func getFileViewController()->FileTableViewController {
        let viewController = storyboard.instantiateViewController(withIdentifier: "file explorer") as! FileTableViewController
        return viewController
    }
    
    private static var storyboard: UIStoryboard = {
        let bundle = Bundle(for: SwiftyFileExplorerUtility.self)
        let storyboardName = "FileExplorer"
        
        return UIStoryboard(name: storyboardName, bundle: bundle)
    }()
}
