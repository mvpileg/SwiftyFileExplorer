//
//  FileTableViewCell.swift
//  PhoneFit 3-4
//
//  Created by Matthew Pileggi on 12/5/16.
//  Copyright © 2016 Matthew Pileggi. All rights reserved.
//

import UIKit

class FileTableViewCell: UITableViewCell {

    @IBOutlet weak var fileName: UILabel!
    @IBOutlet weak var logo: UIImageView!

    func loadCell(item: Item){
        fileName.text = item.name
        logo.image = item.getIcon()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
