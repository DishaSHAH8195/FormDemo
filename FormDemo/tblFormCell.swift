//
//  tblFormCell.swift
//  FormDemo
//
//  Created by Disha on 5/8/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import UIKit

class tblFormCell: UITableViewCell {

    @IBOutlet weak var lblFormTitle: UILabel!
    @IBOutlet weak var lblFormData: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
