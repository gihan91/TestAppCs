//
//  PostTitleViewController.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/20/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Foundation
import RealmSwift


class PostTitleViewController: UIViewController {
    
    @IBOutlet weak var titleListTableView: UITableView!

    var titleList = [PostsModel]()
    var commentList = [UserCommentsModel]()
    var userIdArray = [Int]()
    var postIdCountAarray = [Int]()
    var selectedPostCountId = [Int]()
    var userLatArray = [Float]()
    var userLonArray = [Float]()
    var selectedUserCirty = [String]()
    var userList = [UserModel]()
    var selectedPostTitle = ""
    var selectedPostBody = ""
    var selectedPostUserName = ""
    var selectedPostUserId: Int = 0
    var selectedPostId: Int = 0
    var noOfComments: Int?
    var userLat: Float?
    var userLong: Float?
    var userCity: String?

    let realm = try! Realm()


    override func viewDidLoad() {
        super.viewDidLoad()
        titleListTableView.delegate = self
        titleListTableView.dataSource = self
        getAllPosts()
        getUsers()
        getComments()

    }
    override func viewWillAppear(_ animated: Bool) {
        titleListTableView.reloadData()
    }

    func getAllPosts(){
        Alamofire.request(post, method: .get).responseJSON{
            response in
            switch response.result{
            case .success:
                let json = JSON(response.result.value as Any)
                let jsonAll = json.array
                if jsonAll != nil{
                    for eachData in jsonAll!{
                        let title = eachData["title"].stringValue
                        let id = eachData["id"].intValue
                        let userId = eachData["userId"].intValue
//                        print(userId)
                        let postBody = eachData["body"].stringValue
                        let allTitle = PostsModel(userId: userId, id: id, postsTitle: title, postBody: postBody)
                        self.titleList.append(allTitle)
                        self.userIdArray.append(userId)

                        let postTitle = PostTitleModel()
                        postTitle.titleName = title
                        print(postTitle.titleName)
                        try! self.realm.write {
                            self.realm.add(postTitle)
                        }


                    }
                }
                self.titleListTableView.reloadData()

                break

            case .failure(let error_):
                print(error_)
            }
        }
    }


}

extension PostTitleViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if Reachability.isConnectedToInternet{
             return titleList.count
        }
        else{
             return DBManager.sharedInstance.getDataFromDB().count
        }

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postTitleCell") as! PostTitleTableViewCell
        if Reachability.isConnectedToInternet{
            let setTitleList = titleList[indexPath.row]
            cell.setData(set: setTitleList)
            return cell

        }
        else{
            let dataTitle =  DBManager.sharedInstance.getDataFromDB()
            let allDataTitle = dataTitle[indexPath.row]
            cell.setDataWithoutInternet(set: allDataTitle)
            return cell

        }

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedItem = titleList[indexPath.row]
        selectedPostUserId = userIdArray[indexPath.row]
        selectedPostId = postIdCountAarray[indexPath.row]

        for selectedUserId in userList{

            let userId = selectedUserId.userId
            if userId == selectedPostUserId{
                selectedPostUserName = selectedUserId.name
                userLat = selectedUserId.userLat
                userLong = selectedUserId.userLong
                userCity = selectedUserId.userCity

            }
        }

        for selectPostId in commentList{

            if selectedPostId == selectPostId.postId{
                self.selectedPostCountId.append(selectedPostId)
                self.noOfComments = self.selectedPostCountId.count

            }

        }
         self.selectedPostCountId.removeAll()


        selectedPostTitle = selectedItem.postTitle
        selectedPostBody = selectedItem.postBody

        performSegue(withIdentifier: "showDetails", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showDetails") {
            let vc = segue.destination as! PostsViewController
            vc.postTitle = selectedPostTitle
            vc.postBody = selectedPostBody
            vc.postUserName = selectedPostUserName
            vc.noOfCommentsCount = noOfComments!
            vc.userLat = userLat
            vc.userLong = userLong
            vc.userCity = userCity

        }
    }

}

extension PostTitleViewController{

    func getUsers(){
        Alamofire.request(users, method: .get).responseJSON{
            response in
            switch response.result{
            case .success:
                let json = JSON(response.result.value as Any)
                let jsonAll = json.array
                if jsonAll != nil{
                    for eachData in jsonAll!{
                        let id = eachData["id"].intValue
                        let name = eachData["name"].stringValue
                        let userName = eachData["username"].stringValue
                        let geoLocationsLat = eachData["address"]["geo"]["lat"].floatValue
                        let geoLocationLong = eachData["address"]["geo"]["lng"].floatValue
                        let userCity = eachData["address"]["city"].stringValue
                        let userListAdd = UserModel(userId: id, name: name, userName: userName, userLat: geoLocationsLat, userLong: geoLocationLong, userCity: userCity)

                        self.userList.append(userListAdd)
                        self.userLatArray.append(geoLocationsLat)
                        self.userLonArray.append(geoLocationLong)
                        self.selectedUserCirty.append(userCity)



                    }

                }
                self.titleListTableView.reloadData()

                break

            case .failure(let error_):
                print(error_)
            }
        }
    }


    func getComments(){
        Alamofire.request(comments, method: .get).responseJSON{
            response in
            switch response.result{
            case .success:
                let json = JSON(response.result.value as Any)
                let jsonAll = json.array
                if jsonAll != nil{
                    for eachData in jsonAll!{
                        let postId = eachData["postId"].intValue
                        let postName = eachData["name"].stringValue
                        let postObj = UserCommentsModel(postId: postId, postName: postName)
                        self.commentList.append(postObj)
                        self.postIdCountAarray.append(postId)
                        print(self.postIdCountAarray)

                    }
                }
                self.titleListTableView.reloadData()

                break

            case .failure(let error_):
                print(error_)
            }
        }
    }


}


