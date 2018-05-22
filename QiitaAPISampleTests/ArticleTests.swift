//
//  ArticleTests.swift
//  QiitaAPISampleTests
//
//  Created by macneko_ayu on 2018/05/13.
//  Copyright © 2018年 macneko.leno. All rights reserved.
//

import XCTest
@testable import QiitaAPISample

class ArticleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInitialize() {
        let data = """
         [
           {
             "title": "仮のタイトル",
             "user": {
               "id": "macneko_ayu"
             }
           },
           {
             "title": "仮のタイトル2",
             "user": {
               "id": "macneko_ayu"
             }
           }
         ]
        """.data(using: .utf8)!
        
        let articles = try! JSONDecoder().decode([Article].self, from: data)
        XCTAssertNotNil(articles)
        XCTAssertTrue(articles.count == 2)
        XCTAssertEqual(articles[0].title, "仮のタイトル")
        XCTAssertEqual(articles[0].userId, "macneko_ayu")
    }
}
