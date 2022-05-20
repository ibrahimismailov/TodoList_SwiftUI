//
//  NoItemsView.swift
//  TodoList_SwiftUI
//
//  Created by Abraam on 20.05.2022.
//

import SwiftUI

struct NoItemsView: View {
    @State var animate: Bool = false
    var body: some View {
        ScrollView {
            
            VStack(spacing: 30) {
                
                Text("no, items!")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top, 30)
                    .padding(.bottom, 30)
                Text("You should click to  add button for to add your items to your Todo List")
                    .padding(.bottom, 20)
                NavigationLink(destination: AddView(), label: {
                    Text("Add Items😎")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 70)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color.red : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animate ? 30 : 50)
                .scaleEffect(animate ? 1.1 : 1.0 )
            }
            .multilineTextAlignment(.center)
            .shadow(color: animate ? Color.red.opacity(0.7) : Color.accentColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 10)
            .onAppear(perform: addAnimation)
            .offset( y: animate ? -7 : 0)
               
        }
        .frame(maxWidth: .infinity,  maxHeight: .infinity)
    }
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
            Animation
                .easeInOut(duration: 2.0)
                .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Todo-List")
        }
     
    }
}
