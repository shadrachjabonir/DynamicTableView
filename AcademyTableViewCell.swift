//
//  AcademyTableViewCell.swift
//  DynamicTableView
//
//  Created by Shadrach Jabonir on 04/12/22.
//

import UIKit

class AcademyTableViewCell: UITableViewCell {

    @IBOutlet weak var academyLabel: UILabel!
    @IBOutlet weak var academyImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
