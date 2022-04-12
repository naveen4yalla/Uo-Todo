//
//  TodoRowView.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import SwiftUI

struct TodoRowView: View {
    let item: TodoData
    var body: some View {
        HStack {
            Image(systemName:item.isCompleted ? "checkmark.circle":"circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical ,8)
    }
}

struct TodoRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
        TodoRowView(item: TodoData(title:"dsfdas",isCompleted: false))
        }.previewLayout(.sizeThatFits)
    }
}
