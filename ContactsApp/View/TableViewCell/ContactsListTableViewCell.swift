//
//  ContactsListTableViewCell.swift
//  ContactsApp
//
//  Created by Stuti on 07/07/18.
//  Copyright © 2018 Stuti. All rights reserved.
//

import UIKit

class ContactsListTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var imgPicture: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
