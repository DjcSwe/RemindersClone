//
//  MyListsScreen.swift
//  RemindersClone
//
//  Created by DJC on 9/25/24.
//

import SwiftUI
import SwiftData

struct MyListsScreen: View {
    
    @Query private var myLists: [MyList]
        
    @State private var isPresented: Bool = false
    
    var body: some View {
        List {
            Text("My Lists")
                .font(.largeTitle)
                .bold()
            
            ForEach(myLists) { item in
                HStack {
                    Image(systemName: "line.3.horizontal.circle.fill")
                        .font(.system(size: 32))
                        .foregroundStyle(Color(hex: item.colorCode))
                    Text(item.name)
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

#Preview { @MainActor in
    NavigationStack {
        MyListsScreen()
    }.modelContainer(previewContainer)
}
