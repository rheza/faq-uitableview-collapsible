//
//  FaqFirstCell.swift
//  MyPoin
//
//  Created by Rheza Pahlevi on 05/04/21.
//  Copyright © 2021 EDTS. All rights reserved.
//

import UIKit

class FaqFirstCell: UITableViewCell {

    @IBOutlet weak var step: UILabel!
    
    @IBOutlet weak var stepNo: UILabel!
    
    @IBOutlet weak var backgroundBox: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundBox.clipsToBounds = false
        backgroundBox.backgroundColor = UIColor.white
        backgroundBox.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundBox.layer.shadowColor = UIColor.black.cgColor
        backgroundBox.layer.shadowOpacity = 0.15
        backgroundBox.layer.shadowRadius = 2
        self.backgroundColor = UIColor(named: "Black20")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
