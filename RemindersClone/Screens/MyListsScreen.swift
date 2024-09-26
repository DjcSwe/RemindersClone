//
//  MyListsScreen.swift
//  RemindersClone
//
//  Created by DJC on 9/25/24.
//

import SwiftUI

struct MyListsScreen: View {
    
    let myLists = ["Reminders", "Groceries", "Entertainment"]
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.largeTitle)
                .bold()
            
            ForEach(myLists, id: \.self) { item in
                HStack {
                    Image(systemName: "line.3.horizontal.circle")
                        .font(.system(size: 32))
                    Text(item)
                }
            }
            
            Button(action: {
                isPresented = true
            }, label: {
                Text("Add List")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }).listRowSeparator(.hidden)
            
        }.listStyle(.plain)
            .sheet(isPresented: $isPresented) {
                NavigationStack {
                    AddMyListScreen()
                }
            }
    }
}

#Preview {
    MyListsScreen()
}
