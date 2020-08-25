//
//  TodoModel.swift
//  Todoaaa
//
//  Created by Arni Medic on 25/08/2020.
//  Copyright © 2020 Arni Medic. All rights reserved.
//

import Foundation

public class Todo: Codable {
    var title: String
    var date: String
    
    public init (title: String, date:String) {
        self.title = title
        self.date = date
    }
}
