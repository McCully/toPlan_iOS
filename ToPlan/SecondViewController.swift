//
//  SecondViewController.swift
//  ToPlan
//
//  Created by Mathew Mccully on 10/31/16.
//  Copyright © 2016 Mathew Mccully. All rights reserved.
//

import UIKit
import Alamofire




class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textView: UITextField
    
    
    
    @IBAction func add(_ sender: AnyObject) {
        Alamofire.request(.POST, "https:localhost:8080/tasks" , parameters: ["title": self.textView.test!])
        
    self.navigationController!.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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

