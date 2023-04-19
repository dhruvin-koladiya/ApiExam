//
//  ApiTableViewCell.swift
//  ApiExam
//
//  Created by ABC on 25/03/23.
//

import UIKit

class ApiTableViewCell: UITableViewCell {

    
    @IBOutlet weak var images: UIImageView!
   
    @IBOutlet weak var tagsLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
