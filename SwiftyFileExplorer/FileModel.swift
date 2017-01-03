//
//  FileModel.swift
//  PhoneFit 3-4
//
//  Created by Matthew Pileggi on 12/5/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import Foundation

class FileModel {
    
    private let manager = FileManager.`default`
    private static let defaultDirectoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
    
    var items: [Item]!

    //don't need the didset anymore if we go recursive VC...
    private var path: String
    
    init(path: String = defaultDirectoryPath){
        self.path = path
        loadItems()
    }
    
    private func loadItems(){
        do {
            items = [Item]()
            
            let fileNames = try manager.contentsOfDirectory(atPath: path)
            
            for fileName in fileNames {
                let fullyQualifiedPath = "\(path)/\(fileName)"
                let attributes = try manager.attributesOfItem(atPath: fullyQualifiedPath)
                
                if let type = attributes[FileAttributeKey.type] as? FileAttributeType {
                    
                    if type == .typeDirectory {
                        items.append(Directory(name: fileName, parentPath: path))
                    } else if type == .typeRegular {
                        items.append(File(name: fileName))
                    }
                    
                }
            }
            
        } catch {
            print(error)
        }
    }
}
