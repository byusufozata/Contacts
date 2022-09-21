//
//  UserCellTableViewCell.swift
//  Contacts
//
//  Created by YUSUF ÖZATA on 21.09.2022.
//

import UIKit

class UserCellTableViewCell: UITableViewCell {

    @IBOutlet var userTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
