//
//  ListView.swift
//  TodoList_SwiftUI
//
//  Created by Abraam on 19.05.2022.
//

import SwiftUI

struct ListView: View {
    @State var items: [String] = [
        "This is the first title",
        "This is the second title",
        "This is the third title",
        "This is the fifth title"
    ]
    
    var body: some View {
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
        NavigationLink("Add", destination: AddView())
        )
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
      
    }
}


