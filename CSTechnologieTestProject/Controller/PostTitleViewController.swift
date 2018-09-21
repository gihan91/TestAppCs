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


class PostTitleViewController: UIViewController {
    
    @IBOutlet weak var titleListTableView: UITableView!

    var titleList = [PostsModel]()
    var commentList = [UserCommentsModel]()
    var userIdArray = [Int]()
    var postIdCountAarray = [Int]()
    var selectedPostCountId = [Int]()
    var userList = [UserModel]()
    var selectedPostTitle = ""
    var selectedPostBody = ""
    var selectedPostUserName = ""
    var selectedPostUserId: Int = 0
    var selectedPostId: Int = 0
    var noOfComments: Int?


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
        return titleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postTitleCell") as! PostTitleTableViewCell
        let setTitleList = titleList[indexPath.row]
        cell.setData(set: setTitleList)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let selectedItem = titleList[indexPath.row]
        selectedPostUserId = userIdArray[indexPath.row]
        print(selectedPostId)
        selectedPostId = postIdCountAarray[indexPath.row]

        for selectedUserId in userList{

            let userId = selectedUserId.userId
            if userId == selectedPostUserId{
                selectedPostUserName = selectedUserId.name

            }
        }

        for selectPostId in commentList{

            if selectedPostId == selectPostId.postId{
                self.selectedPostCountId.append(selectedPostId)
                print(selectedPostCountId.count)
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
                        let userLat = eachData["lat"].floatValue
                        let userLon = eachData["lng"].floatValue
                        let userListAdd = UserModel(userId: id, name: name, userName: userName, userLat: userLat, userLong: userLon)
                        self.userList.append(userListAdd)


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


