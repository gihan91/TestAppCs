//
//  PostsTableViewCell.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/20/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var noOfCommentsLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
