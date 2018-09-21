//
//  DBManager.swift
//  CSTechnologieTestProject
//
//  Created by Gihan Chanaka Beligaswaththa on 9/21/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager {

    private var database:Realm
    static let sharedInstance = DBManager()

    private init() {

        database = try! Realm()

    }

    func getDataFromDB() -> Results<PostTitleModel> {

        let results: Results<PostTitleModel> = database.objects(PostTitleModel.self)
        return results
    }

    func addData(object: PostTitleModel) {

        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }

    func deleteAllDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }

    func deleteFromDb(object: PostTitleModel) {

        try! database.write {

            database.delete(object)
        }
    }

}
