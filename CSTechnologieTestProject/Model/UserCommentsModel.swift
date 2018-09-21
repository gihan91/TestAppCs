//
//  UserCommentsModel.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/20/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import Foundation

class UserCommentsModel{
    private var _postId: Int?
    private var _postName: String?

    init(postId: Int,postName: String){
        self._postId = postId
        self._postName = postName

    }
//Getters and Setters
    public var postId: Int{
        get{
            return _postId!
        }
        set{
            _postId = newValue
        }
    }

    public var postName: String{
        get{
            return _postName!
        }
        set{
            _postName = newValue
        }
    }

}
