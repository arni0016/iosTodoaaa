//
//  TaskViewController.swift
//  Todoaaa
//
//  Created by Arni Medic on 24/08/2020.
//  Copyright © 2020 Arni Medic. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet var label: UILabel!
    
    var task: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = task
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .done, target: self, action: #selector(deleteTask))
        // Do any additional setup after loading the view.
    }
    
    @objc func deleteTask() {
        
    }
    

}
