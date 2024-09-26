//
//  PreviewContainer.swift
//  RemindersClone
//
//  Created by DJC on 9/26/24.
//

import Foundation
import SwiftData

@MainActor
var previewContainer: ModelContainer = {
    let container = try! ModelContainer(for: MyList.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    
    for myList in SampleData.MyLists {
        container.mainContext.insert(myList)
    }
    
    return container
}()


struct SampleData {
    static var MyLists: [MyList] {
        return [MyList(name: "Reminders", colorCode: "#2ecc71"), MyList(name: "Backlog", colorCode: "#9b59b6")]
    }
}
