//
//  noitems.swift
//  TodoApp
//
//  Created by Naveen Yalla on 4/11/22.
//

import SwiftUI

struct noitems: View {
    @State private var showingSheet = false
    @State var animate :Bool = false
    let sceondaryAccentColor = Color("SecondaryAccentColor")
    var body: some View {
        ScrollView {
            VStack{
                Text("There are no items!").font(.title)
                    .fontWeight(.semibold)
                Text("Be Productive by adding Todos")
                Button(action:{
                    showingSheet.toggle()
                } ,label:{
                    Text("Add Something 😃".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .background(animate ? sceondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal,animate ? 30 : 50)
                .shadow(color:animate ? sceondaryAccentColor.opacity(0.7):
                            Color.accentColor.opacity(0.7),
                        radius:animate ? 30 : 10,x:0,y:animate ? 50 :30)
                    .scaleEffect(animate ? 1.1 :1.0)
                .sheet(isPresented: $showingSheet) {
                    sheetView()
                } 
            }.frame(maxWidth:400)
            .padding(40)
                .onAppear(perform: addAnimation)
           
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
        func addAnimation(){
            guard !animate else{return}
            DispatchQueue.main.asyncAfter(deadline: .now()+1.5) {
                withAnimation(Animation.easeInOut(duration:2.0).repeatForever()){
                    animate.toggle()
                }
            }
        }
    
    
    
}

struct noitems_Previews: PreviewProvider {
    static var previews: some View {
        noitems()
    }
}

