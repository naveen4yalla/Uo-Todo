//
//  ListViewModel.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import Foundation
class ListViewModel:ObservableObject{
    @Published var todos:[TodoData] = []{
        didSet{
            saveItems()
        }
    }
    let todosKey: String = "todosList"
    init()
    {
        getItems()
    }
    func getItems(){
//         let items: [TodoData] = [TodoData(title:"First Todo",isCompleted: false),TodoData(title:"Second Todo",isCompleted: true)]
        guard let data = UserDefaults.standard.data(forKey: todosKey) else{
            return
        }
        guard let savedItems = try? JSONDecoder().decode([TodoData].self, from: data) else{
            return
        }
        self.todos = savedItems
    }
    func deleteItem(indexSet: IndexSet){
        todos.remove(atOffsets:indexSet)
    }
    func moveItem(from:IndexSet ,to:Int){
        todos.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title:String)
    {
        let newItem = TodoData(title: title, isCompleted:false)
        todos.append(newItem)
    }
    func updateItem(item:TodoData){
        if let index = todos.firstIndex(where:{$0.id == item.id }){
            todos[index] = item.updateCompletion()
            
        }
    }
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(todos){
            UserDefaults.standard.set(encodedData,forKey:todosKey )
        }
    }
}
