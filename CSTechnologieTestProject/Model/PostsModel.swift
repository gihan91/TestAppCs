//
//  PostsModel.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/19/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import Foundation

class PostsModel{
    //MARK- Declaring Properties of Posts
    private var _userId: Int?
    private var _id: Int?
    private var _postTitle: String?
    private var _postBody: String?

    init(userId: Int,id: Int,postsTitle: String,postBody: String) {
        self._userId = userId
        self._id = id
        self._postTitle = postsTitle
        self._postBody = postBody
    }
    init(postTitle: String){
        self._postTitle = postTitle

    }

    //Getters and Setters
    public var userId: Int{
        get{
            return _userId!
        }
        set{
            _userId = newValue
        }
    }
    public var id: Int{
        get{
            return _id!
        }
        set{
            _id = newValue
        }
    }
    public var postTitle: String{
        get{
            return _postTitle!
        }
        set{
            _postTitle = newValue
        }
    }
    public var postBody: String{
        get{
            return _postBody!
        }
        set{
            _postBody = newValue
        }
    }
}
