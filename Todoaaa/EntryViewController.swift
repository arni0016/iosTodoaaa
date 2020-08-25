//
//  EntryViewController.swift
//  Todoaaa
//
//  Created by Arni Medic on 24/08/2020.
//  Copyright © 2020 Arni Medic. All rights reserved.
//

import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var field: UITextField!
    @IBOutlet var dateField: UITextField!
    var datePicker: UIDatePicker!
    
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        print("test")
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.short
        dateField.text = dateFormatter.string(from: sender.date)
    }
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
        dateField.delegate = self
        datePicker = UIDatePicker()
        
        dateField.inputView = datePicker
        
        
        print("tes222t")
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveTask))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        saveTask()
        return true
    }
    
    @objc func saveTask() {
        guard let text = field.text, !text.isEmpty else {
            return
        }
        
        guard let date = dateField.text, !date.isEmpty else {
            return
        }
        
        let task = Todo(title: text, date: date)
        
        guard let count = UserDefaults().value(forKey: "count") as? Int else {
            return
        }
        let newCount = count + 1
        UserDefaults().set(newCount, forKey: "count")
        
        do {
            let encoded = try JSONEncoder().encode(task)
            UserDefaults().set(encoded, forKey: "task_\(newCount)")
        }
        catch {
            print("lort")
        }
        
        
        
        
        update?()
        
        navigationController?.popViewController(animated: true)
    }
    
}
