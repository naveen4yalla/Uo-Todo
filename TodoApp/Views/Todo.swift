//
//  Todo.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import SwiftUI

struct Todo: View {
    @EnvironmentObject var listViewModel:ListViewModel
    @State private var showingSheet = false
    
    var body: some View {
        ZStack{
            if listViewModel.todos.isEmpty{
                noitems().transition(AnyTransition.opacity.animation(.easeIn))
            }
            else{
                List{
                    ForEach(listViewModel.todos){item in
                        TodoRowView(item:item).onTapGesture {
                            withAnimation(.linear){
                                listViewModel.updateItem(item: item)
                            }
                        }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }.listStyle(PlainListStyle())
            }
        }
            .navigationTitle("Todo List")
            .navigationBarItems(leading: EditButton(), trailing:Button("Add Todo") {
                showingSheet.toggle()
            }
            .sheet(isPresented: $showingSheet) {
                sheetView()
            } )
    }
    
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        Todo()
        }.environmentObject(ListViewModel())
    }
}

