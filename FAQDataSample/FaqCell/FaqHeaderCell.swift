//
//  Faqswift
//  MyPoin
//
//  Created by Rheza Pahlevi on 01/04/21.
//  Copyright © 2021 EDTS. All rights reserved.
//

import UIKit

class FaqHeaderCell: UITableViewCell {
    @IBOutlet weak var bankLogo: UIImageView!
    
    @IBOutlet weak var bankName: UILabel!

 
    @IBOutlet weak var backgroundBox: UIView!
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var arrowLogo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundBox.clipsToBounds = false
        backgroundBox.backgroundColor = UIColor.white
        backgroundBox.layer.cornerRadius = 8
        backgroundBox.layer.shadowOffset = CGSize(width: 0, height: 0)
        backgroundBox.layer.shadowColor = UIColor.black.cgColor
        backgroundBox.layer.shadowOpacity = 0.15
        backgroundBox.layer.shadowRadius = 2
        self.backgroundColor = UIColor(named: "Black20")
        
        bankLogo.backgroundColor = .gray
        // Initialization code
    }

   
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for subview in subviews where (subview != contentView && abs(subview.frame.width - frame.width) <= 0.1 && subview.frame.height < 2) {
            subview.removeFromSuperview()
        }
     }
}
