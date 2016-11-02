//
//  APIClient.swift
//  QiitaAPISample
//
//  Created by macneko_ayu on 2016/02/20.
//  Copyright © 2016年 macneko.leno. All rights reserved.
//

import Alamofire
import ObjectMapper

class APIClient {

    func getAllItems(_ success: @escaping (([Item]) -> Void)) {
        let urlString: String = "https://qiita.com/api/v2/items"

        Alamofire.request(urlString).responseJSON { response in
            switch response.result {
            case .success(let value):
                if let items = value as? [[String : Any]] {
                    var resultItems: [Item] = []
                    for item in items {
                        resultItems.append(Mapper<Item>().map(JSON: item)!)
                    }
                    success(resultItems)
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
}
