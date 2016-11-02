//
//  ViewController.swift
//  QiitaAPISample
//
//  Created by macneko_ayu on 2016/02/20.
//  Copyright © 2016年 macneko.leno. All rights reserved.
//

import UIKit

class ArticleListViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var items: [Item] = []
    let client = APIClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "新着記事"
        tableView.dataSource = self

        client.getAllItems() { resultItems in
            self.items = resultItems
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        let item = items[indexPath.row]
        if let title = item.title {
            cell.textLabel?.text = title
        }
        if let userId = item.userId {
            cell.detailTextLabel?.text = userId
        }
        return cell
    }
}

