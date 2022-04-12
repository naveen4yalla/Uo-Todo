//
//  TodoModel.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import Foundation
struct TodoData: Identifiable, Codable{
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title:String , isCompleted:Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        
    }
    func updateCompletion() -> TodoData {
        return TodoData(id: id,title: title,isCompleted: !isCompleted)
        
    }
}
