//
//  FileSaveHelper.swift
//  PhoneFit 3-4
//
//  Created by Matthew Pileggi on 7/30/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

class FileSaveHelper {
  
    
    fileprivate enum FileErrors: Error {
        case jsonNotSerialized
        case fileNotSaved
        case imageNotConvertedToData
        case fileNotRead
        case fileNotFound
    }
    
    fileprivate let directory: FileManager.SearchPathDirectory!
    fileprivate let directoryPath: String!
    fileprivate let fileManager = FileManager.default
    fileprivate let fileName: String!
    fileprivate let filePath: String!
    fileprivate let fullyQualifiedPath: String!
    fileprivate let subDirectory: String!
    
    var fileExists: Bool {
        get {
            return fileManager.fileExists(atPath: fullyQualifiedPath)
        }
    }
    
    var directoryExists: Bool {
        get {
            var isDir = ObjCBool(true)
            return fileManager.fileExists(atPath: filePath, isDirectory: &isDir)
        }
    }
    
    init(fileNameWithExtension: String, subDirectory: String, directory: FileManager.SearchPathDirectory) {
        self.fileName = fileNameWithExtension
        self.subDirectory = "/\(subDirectory)"
        self.directory = directory
        self.directoryPath = NSSearchPathForDirectoriesInDomains(directory, .userDomainMask, true)[0]
        self.filePath = directoryPath + self.subDirectory
        self.fullyQualifiedPath = "\(filePath!)/\(self.fileName!)"
        
        createDirectory()
    }
    
    convenience init(fileNameWithExtension: String, subDirectory: String){
        self.init(fileNameWithExtension: fileNameWithExtension, subDirectory: subDirectory, directory: .documentDirectory)
     }
 
    
    func saveFile(_ text: String) throws {
        do {
            try text.write(toFile: fullyQualifiedPath, atomically: true, encoding: String.Encoding.utf8)
        } catch {
            throw error
        }
    }
    
    func saveFile(_ json: AnyObject) throws {
        do {
            let jsonData = try convertObjectToData(json)
            if !fileManager.createFile(atPath: fullyQualifiedPath, contents: jsonData, attributes: nil) {
                throw FileErrors.fileNotSaved
            }
        } catch {
            throw FileErrors.fileNotSaved
        }
    }
    
    func saveFile(_ image: UIImage) throws {
        guard let data = UIImageJPEGRepresentation(image, 1.0) else {
            throw FileErrors.imageNotConvertedToData
        }
        
        if !fileManager.createFile(atPath: fullyQualifiedPath, contents: data, attributes: nil) {
            throw FileErrors.fileNotSaved
        }
    }
    
    func saveFile(_ data: Data) throws {
        if !fileManager.createFile(atPath: fullyQualifiedPath, contents: data, attributes: nil) {
            throw FileErrors.fileNotSaved
        }
    }
    
    func getContentsOfFile() throws -> String {
        guard fileExists else {
            throw FileErrors.fileNotFound
        }
        
        var returnString: String
        
        do {
            returnString = try String(contentsOfFile: fullyQualifiedPath, encoding: String.Encoding.utf8)
        } catch {
            throw FileErrors.fileNotRead
        }
        
        return returnString
    }
    
    func getImage() throws -> UIImage {
        guard fileExists else {
            throw FileErrors.fileNotFound
        }
        
        guard let image = UIImage(contentsOfFile: fullyQualifiedPath) else {
            throw FileErrors.fileNotRead
        }
        
        return image
    }
    
    func getJSONData() throws -> NSDictionary {
        guard fileExists else {
            throw FileErrors.fileNotFound
        }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: fullyQualifiedPath), options: .mappedIfSafe)
            let jsonDictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! NSDictionary
            return jsonDictionary
        } catch {
            throw FileErrors.fileNotRead
        }
    }
    
    func getData() -> Data {
        return (try! Data(contentsOf: URL(fileURLWithPath: fullyQualifiedPath)))
    }
    
    func getURLToFile() -> URL {
        return URL(fileURLWithPath: fullyQualifiedPath)
    }
    
    fileprivate func convertObjectToData(_ data: AnyObject) throws -> Data {
        
        do {
            let newData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
            return newData
        } catch {
            
        }
        throw FileErrors.jsonNotSerialized
        
    }
    
    fileprivate func createDirectory() {
        if !directoryExists {
            do {
                try fileManager.createDirectory(atPath: filePath, withIntermediateDirectories: false, attributes: nil)
            } catch {
                print("An Error was generated creating directory")
            }
        }
    }
}
