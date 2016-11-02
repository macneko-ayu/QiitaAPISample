//
//  Item.swift
//  QiitaAPISample
//
//  Created by macneko_ayu on 2016/03/06.
//  Copyright © 2016年 macneko.leno. All rights reserved.
//

import Foundation
import ObjectMapper

struct Item: Mappable {
    var title: String?
    var userId: String?
    
    init?(map: Map){}
    
    mutating func mapping(map: Map) {
        title  <- map["title"]
        userId <- map["user.id"]
    }
}
