//
//  CSTechnologieTestProjectTests.swift
//  CSTechnologieTestProjectTests
//
//  Created by Gihan Chanaka Beligaswaththa on 9/19/18.
//  Copyright © 2018 Gihan Chanaka Beligaswaththa. All rights reserved.
//

import XCTest
@testable import CSTechnologieTestProject

class CSTechnologieTestProjectTests: XCTestCase {
    //Test BaseUrl
    func testBaseAPI(){
        var baseUrlTest: String?
        XCTAssertNil(baseUrlTest)
        baseUrlTest = "http://jsonplaceholder.typicode.com/"
        XCTAssertEqual(baseUrlTest, baseUrl)


    }
    //Test Post Url
    func testPostUrl(){
        var postUrl: String?
        XCTAssertNil(postUrl)
        postUrl = "http://jsonplaceholder.typicode.com/posts"
        XCTAssertEqual(postUrl, post)

    }
    //Test Comment Url
    func testCommentUrl(){
        var commentUrl: String?
        XCTAssertNil(commentUrl)
        commentUrl = "http://jsonplaceholder.typicode.com/comments"
        XCTAssertEqual(commentUrl, comments)

    }
    
    func testInitTableView(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "titleTableView") as! PostTitleViewController
        //calls viewdidload from vc
        _ = vc.view
        XCTAssertNotNil(vc.titleListTableView)

    }
    func testInitMapVC(){
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "mapView") as! MapViewController
        //calls viewdidload from vc
        _ = vc.view
        XCTAssertNotNil(vc.mapView)

    }

}
