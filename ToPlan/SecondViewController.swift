//
//  SecondViewController.swift
//  ToPlan
//
//  Created by Mathew Mccully on 10/31/16.
//  Copyright © 2016 Mathew Mccully. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var itemTextField: UITextField!
    
    @IBAction func add(_ sender: AnyObject) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:NSMutableArray
        if let tempItems = itemsObject as? NSMutableArray {
            items = tempItems
            items.addObjects(from: [itemTextField.text!])
        } else {
            let items = [itemTextField.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        itemTextField.text! = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

