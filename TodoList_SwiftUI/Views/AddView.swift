//
//  AddView.swift
//  TodoList_SwiftUI
//
//  Created by Abraam on 19.05.2022.
//

import SwiftUI

struct AddView: View {
    @State var textfieldText: String = ""
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                
                Button(action: {
                    
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(16)
                
        }
        
        .navigationTitle("Add an item 👩‍🏫")
       
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
      
    }
}
