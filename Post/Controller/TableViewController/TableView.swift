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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = table.dequeueReusableCell(withIdentifier: "customeCell", for: indexPath) as! customeCell
        cell.username.text = "ahmed"
        cell.posttext.text = "ksdlknsfkjn"
        cell.likes.text = "10"
        cell.time.text = "5225"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    
}
