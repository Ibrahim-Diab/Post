//
//  TableView.swift
//  Post
//
//  Created by deepo on 12/12/20.
//  Copyright © 2020 deepo. All rights reserved.
//

import UIKit
extension HomeVc:UITableViewDelegate,UITableViewDataSource
{
      
    
    func tablesetup()
    {
        
    table.dataSource = self
    table.delegate = self
    table.register(UINib(nibName: "customeCell", bundle: nil), forCellReuseIdentifier: "customeCell")

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "customeCell", for: indexPath) as! customeCell
        cell.Configretion(post: items[indexPath.row])
        return cell
    }
    
    
    
    
    
}
