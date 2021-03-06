//
//  TodoList_SwiftUIApp.swift
//  TodoList_SwiftUI
//
//  Created by Abraam on 19.05.2022.
//

import SwiftUI

@main
struct TodoList_SwiftUIApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
        
    }
}
