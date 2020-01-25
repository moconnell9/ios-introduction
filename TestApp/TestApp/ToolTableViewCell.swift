//
//  ToolTableViewCell.swift
//  TestApp
//
//  Created by Oconnell, Madeline on 1/24/20.
//  Copyright © 2020 Oconnell, Madeline. All rights reserved.
//

import UIKit

class ToolTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel!
    @IBOutlet weak var secondaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
