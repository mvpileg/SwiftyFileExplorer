//
//  TableViewController.swift
//  PhoneFit 3-4
//
//  Created by Matthew Pileggi on 12/5/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

class FileTableViewController: UITableViewController {

    var model: FileModel!
    
    
    @IBAction func close(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if model == nil {
            model = FileModel()
        }

    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "file row", for: indexPath) as! FileTableViewCell

        let row = indexPath.row
        let item = model.items[row]

        cell.loadCell(item: item)

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = model.items[indexPath.row]
    
        if let directory = item as? Directory {
            let storyboard = UIStoryboard(name: "FileExplorer", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "file explorer") as! FileTableViewController
            vc.model = FileModel(path: directory.path)
            
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

}
