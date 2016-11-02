//
//  FirstViewController.swift
//  ToPlan
//
//  Created by Mathew Mccully on 10/31/16.
//  Copyright © 2016 Mathew Mccully. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items:NSMutableArray = []
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
        
    }
    
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        var cellLabel = ""
        if let tempLabel =  items[indexPath.row] as? String {
            cellLabel = tempLabel
        }
        cell.textLabel?.text = cellLabel
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        if let tempItems = itemsObject as? NSMutableArray {
            items = tempItems
          }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

