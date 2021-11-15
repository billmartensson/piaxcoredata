//
//  TodoDetail.swift
//  piaxcoredata
//
//  Created by Bill Martensson on 2021-11-15.
//

import SwiftUI

struct TodoDetail: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var currenttodo : Todothing?

    @State private var todotitle = ""
    @State private var tododesc = ""
    @State var istododone = false
    
    var body: some View {
        VStack {
            TextField("", text: $todotitle)
            
            TextEditor(text: $tododesc)
                .padding(.horizontal)
                .frame(height: 200.0)
                .background(.gray)
            
            Toggle(isOn: $istododone) {
                Text("Är klar")
            }
            
            Button(action: saveTodo) {
                Text("Spara")
            }
            
            Spacer()
            
        }.onAppear(perform: {
            print("NU ÄR DET onAppear")
            if let tdesc = currenttodo?.tododescription {
                tododesc = tdesc
            }
            
            todotitle = currenttodo!.todotitle!
            
            istododone = currenttodo!.isdone
        }).onDisappear(perform: {
            print("NU ÄR DET onDisappear")
            saveTodo()
        })
    }
    
    
    func saveTodo()
    {
        currenttodo!.tododescription = tododesc
        currenttodo!.isdone = istododone
        currenttodo!.todotitle = todotitle
        
        do {
            try viewContext.save()
            
            presentationMode.wrappedValue.dismiss()
            
        } catch {
            print("Spara fel")
        }
    }
    
}

struct TodoDetail_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetail()
    }
}
