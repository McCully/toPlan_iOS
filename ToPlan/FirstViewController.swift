//
//  FirstViewController.swift
//  ToPlan
//
//  Created by Mathew Mccully on 10/31/16.
//  Copyright © 2016 Mathew Mccully. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class FirstViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var jsonArray:NSArray?
    var newArray: Array<String> = []
    var IDArray: Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
//        self.tableView.dataSource = self
    }
    
    func downloadAndUpdate(){
        self.newArray.removeAll()
        self.IDArray.removeAll()
    
        Alamofire.request(url: "http://localhost:8080/tasks", method: .get) .responseJSON { response in
            print(response.request)
            print(response.response)
            print(response.data)
            print(response.result)
        
        
        if let JSON = response.result.value {
            self.jsonArray = JSON as? NSMutableArray
            for item in self.jsonArray! {
                print(item["item"]!)
                let string = item["title"]!
                let ID = item["id"]!
                print("String is \(string!)")
                
                self.newArray.append(string! as! String)
                self.IDArray.append(ID! as! String)
            }
            
            print("New array is \(self.newArray)")
            
            self.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("ID us \(self.IDArray[indexPath.row])")
            
            Alamofire.request(url: "http://localhost:8080/tasks/\(self.IDArray[indexPath.row])", method: .delete, encoding: JSONEncoding.default)
            
            self.downloadAndUpdate()
        } else if editingStyle == .insert {
            
        }
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        self.downloadAndUpdate()
        print("Calling...")
    }
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.newArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as UITableViewCell
        
        cell.textLabel?.text = self.newArray[indexPath.row]
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

