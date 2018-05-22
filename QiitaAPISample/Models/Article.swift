//
//  Article.swift
//  QiitaAPISample
//
//  Created by 横田孝次郎 on 2018/05/17.
//  Copyright © 2018年 macneko.leno. All rights reserved.
//

import Foundation

struct Article: Codable {
    var title: String?
    var userId: String?
    
    private enum UserKeys: String, CodingKey {
        case userId = "id"
    }
    
    private enum ArticleKeys: String, CodingKey {
        case title
        case user
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: ArticleKeys.self)
        self.title = try values.decode(String.self, forKey: .title)
        let user = try values.nestedContainer(keyedBy: UserKeys.self, forKey: .user)
        self.userId = try user.decode(String.self, forKey: .userId)
    }
}
