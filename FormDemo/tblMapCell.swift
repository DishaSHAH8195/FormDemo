//
//  tblMapCell.swift
//  FormDemo
//
//  Created by Disha on 5/8/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import UIKit

class tblMapCell: UITableViewCell {

    @IBOutlet weak var lblLanguageCode: UILabel!
    @IBOutlet weak var lblCountryCode: UILabel!
    @IBOutlet weak var lblCountryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
