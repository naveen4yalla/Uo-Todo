//
//  sheetView.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import SwiftUI

struct sheetView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listViewModel:ListViewModel
    @State var textFieldText:String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    var body: some View {
        NavigationView{
        ScrollView{
            VStack{
            TextField("Type something here..",text: $textFieldText)
                .padding(.horizontal)
                .frame(height:55)
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(15)
                Button(action:{
                    saveButtonPressed()
                    
                    
                },label:{
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(14)
                .navigationTitle("Add Todo")
                .alert(isPresented : $showAlert,content: getAlert)
            
            
        }
        
        
    }
    }
    func saveButtonPressed(){
        if checkLengthOfText(){
            listViewModel.addItem(title: textFieldText)
            dismiss()
        }
       
        
    }
    func checkLengthOfText() -> Bool {
        if textFieldText.count < 3{
            alertTitle = "Please input a appropriate Todo"
            showAlert.toggle()
            return false
        }
        else{
            return true
        }
    }
    func getAlert() -> Alert{
        return Alert(title:Text(alertTitle))
    }
}

struct sheetView_Previews: PreviewProvider {
    static var previews: some View {
        //NavigationView{
        sheetView()
        //}
    }
}
