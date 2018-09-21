//
//  PostTitleTableViewCell.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/20/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import UIKit

class PostTitleTableViewCell: UITableViewCell {

    @IBOutlet weak var postTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(set: PostsModel){
        postTitleLabel.text = set.postTitle
    }
    func setDataWithoutInternet(set: PostTitleModel){
        postTitleLabel.text = set.titleName
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
