//
//  PersonDetail.swift
//  piaxcoredata
//
//  Created by Bill Martensson on 2021-11-15.
//

import SwiftUI

struct PersonDetail: View {
    
    @Environment(\.managedObjectContext) private var viewContext

    
    @State var theperson : Item?
    
    
    var body: some View {
        VStack {
            Text(theperson!.timestamp!, formatter: itemFormatter)
                .font(.title)
            
            
            if let fname = theperson!.firstname {
                Text(fname)
                    .padding(.top)
            }
            
            Button(action: {
                theperson!.firstname = "Torsten"
                
                do {
                    try viewContext.save()
                } catch {
                    print("spara fel")
                }
            }) {
                Text("Byt namn")
            }
            
        }
    }
}

struct PersonDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        //var tempperson = Item()
        //tempperson.firstname = "Torsten"
        
        PersonDetail()
    }
}
