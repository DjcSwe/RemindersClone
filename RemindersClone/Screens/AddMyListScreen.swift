//
//  AddMyListScreen.swift
//  RemindersClone
//
//  Created by DJC on 9/25/24.
//

import SwiftUI
import SwiftData

struct AddMyListScreen: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    @State private var listName: String = ""
    @State private var color: Color = .blue
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "line.3.horizontal.circle")
                .font(.system(size: 80))
                .foregroundStyle(color)
            
            TextField("List name", text: $listName)
                .textFieldStyle(.roundedBorder)
                .padding([.leading, .trailing], 44)
            
            ColorPickerView(selectedColor: $color)
        }
        .navigationTitle("Add List")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button("Done") {
                    guard let hex = color.toHex() else { return }
                    
                    let myList = MyList(name: listName, colorCode: hex)
                    context.insert(myList)
                    dismiss()
                }
            }
        }
    }
}

#Preview { @MainActor in
    NavigationStack {
        AddMyListScreen()
    }.modelContainer(previewContainer)
}
