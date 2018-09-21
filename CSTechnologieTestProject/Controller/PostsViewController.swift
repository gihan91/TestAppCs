//
//  PostsViewController.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/19/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class PostsViewController: UIViewController {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var noOfComments: UILabel!

    var postTitle = ""
    var postBody = ""
    var postUserName = ""
    var noOfCommentsCount: Int = 0

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setuoUi()



    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    func setuoUi(){
        self.postTitleLabel.text = postTitle
        self.postBodyLabel.text = postBody
        self.userNameLabel.text = postUserName
        noOfComments.text = String(noOfCommentsCount)

    }
 

}
