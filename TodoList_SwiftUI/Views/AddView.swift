//
//  AddView.swift
//  TodoList_SwiftUI
//
//  Created by Abraam on 19.05.2022.
//

import SwiftUI

struct AddView: View {
    
    @State var textfieldText: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.presentationMode) var presentationMode
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false

    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something...", text: $textfieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                Button(action: saveButtonPressed, label: {
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
            .navigationTitle("Add an item ✐")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    func saveButtonPressed() {
        if checkTextFieldText() {
            listViewModel.addItem(title: textfieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    func checkTextFieldText() -> Bool {
        if textfieldText.count < 3 {
            alertTitle = "items must be minimum three characters😕"
            showAlert.toggle()
            return false
        }
        return true
    }
}
struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
