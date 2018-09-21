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

class PostsViewController: UIViewController,UIGestureRecognizerDelegate {
    
    @IBOutlet weak var postTitleLabel: UILabel!
    @IBOutlet weak var postBodyLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var noOfComments: UILabel!
    @IBOutlet weak var userNameGestureView: UIView!

    var postTitle = ""
    var postBody = ""
    var postUserName = ""
    var noOfCommentsCount: Int = 0
    var userLat: Float?
    var userLong: Float?
    var userCity: String?

    

    override func viewDidLoad() {
        super.viewDidLoad()
        setuoUi()
        //storing data
        let defaults = UserDefaults.standard
        defaults.set(userLat, forKey: defaultKeys.userLat)
        defaults.set(userLong, forKey: defaultKeys.userLong)
        defaults.set(userCity, forKey: defaultKeys.userCity)
        //adding UIgesture for name
        let gestureSwift2AndHigher = UITapGestureRecognizer(target: self, action:  #selector (self.showCity (_:)))
        self.userNameGestureView.addGestureRecognizer(gestureSwift2AndHigher)


    }
    //selectore for show city
    @objc func showCity(_ sender:UITapGestureRecognizer){
        let mapVC = self.storyboard?.instantiateViewController(withIdentifier: "mapView") as! MapViewController
        self.present(mapVC, animated: true, completion: nil)
    }

    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    //Setting up UI
    func setuoUi(){
        self.postTitleLabel.text = postTitle
        self.postBodyLabel.text = postBody
        self.userNameLabel.text = postUserName
        noOfComments.text = String(noOfCommentsCount)

    }
 

}
