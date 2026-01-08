//
//  Goal.swift
//  BucketList
//
//  Created by app-kaihatsusha on 08/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Goal {
    var title: String
    var notes: String
    var completed: Bool
    var completedOn: Date = Date()
    
    init(title: String, notes: String, completed: Bool, completedOn: Date = Date()) {
        self.title = title
        self.notes = notes
        self.completed = completed
        self.completedOn = completedOn
    }
    
    convenience init() {
        self.init(title: "", notes: "", completed: false)
    }
}

extension Goal {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Goal.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        
        let calendar = Calendar.current
        let scubaCertCompletedOn = calendar.date(from: DateComponents(year: 2025, month: 12, day: 25))!
        let greatHikeCompletedOn = calendar.date(from: DateComponents(year: 2024, month: 03, day: 01))!
        
        container.mainContext.insert(Goal(title: "Dive the Great Barrier Reef", notes: "Need scuba certification first", completed: false))
        container.mainContext.insert(Goal(title: "Become Scuba Certified", notes: "NEast Coast Divers is in Brookline, MA that can do this", completed: true, completedOn: scubaCertCompletedOn))
        container.mainContext.insert(Goal(title: "Hike the Great Wall", notes: "Maybe during study abroad", completed: true, completedOn: greatHikeCompletedOn))
        container.mainContext.insert(Goal(title: "Safari in Kenya", notes: "Try to schedule something during the Great Migration", completed: false))
        container.mainContext.insert(Goal(title: "Hike Machu Picchu", notes: "Learning to surf in Lima might also be cool", completed: false))
        
        return container
    }
}
