//
//  AddMyListScreen.swift
//  RemindersClone
//
//  Created by DJC on 9/25/24.
//

import SwiftUI

struct AddMyListScreen: View {
    
    @State private var listName: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "line.3.horizontal.circle")
                .font(.system(size: 80))
                .foregroundStyle(.blue)
            
            TextField("List name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 44)
        }
    }
}

#Preview {
    AddMyListScreen()
}
