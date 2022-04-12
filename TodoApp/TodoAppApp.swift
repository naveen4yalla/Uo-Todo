//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import SwiftUI

@main
struct TodoAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
            Todo()
            }.navigationViewStyle(StackNavigationViewStyle()).environmentObject(listViewModel)
        }
    }
}
