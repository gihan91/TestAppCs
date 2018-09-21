//
//  UserModel.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/20/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import Foundation

class UserModel{
    private var _userId: Int?
    private var _name: String?
    private var _userName: String?
    private var _userLatitude: Float?
    private var _userLong: Float?
    private var _userCity: String?

    init(userId: Int,name: String,userName: String,userLat: Float,userLong: Float,userCity: String){
        self._userId = userId
        self._name = name
        self._userName = userName
        self._userLatitude = userLat
        self._userLong = userLong
        self._userCity = userCity

    }
//Getters and setters
    public var userId: Int{
        get{
            return _userId!
        }
        set{
            _userId = newValue
        }
    }
    public var name: String{
        get{
            return _name!
        }
        set{
            _name = newValue
        }
    }
    public var userName: String{
        get{
            return _userName!
        }
        set{
            _userName = newValue
        }
    }

    public var userLat: Float{
        get{
            return _userLatitude!
        }
        set{
            _userLatitude = newValue
        }
    }
    public var userLong: Float{
        get{
            return _userLong!
        }
        set{
            _userLong = newValue
        }
    }

    public var userCity: String{
        get{
            return _userCity!
        }
        set{
            _userCity = newValue
        }
    }


}
