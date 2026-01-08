//
//  BucketListView.swift
//  BucketList
//
//  Created by app-kaihatsusha on 08/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData


struct BucketListView: View {
    
    enum Segments: String, CaseIterable {
        case all = "All"
        case completed = "Completed"
        case open = "Open"
    }
    
    @State private var isSheetPresented = false
    @State private var selectedSegment: Segments = .all
    
    @Environment(\.modelContext) var modelContext
    @Query var goals: [Goal]
    
    private var filteredGoals: [Goal] {
        switch selectedSegment {
        case .all:
            return goals
        case .completed:
            return goals.filter { $0.completed }
        case .open:
            return goals.filter { !$0.completed }
        }
    }
    
    var body: some View {
        NavigationStack {
           
            Picker("", selection:$selectedSegment) {
                ForEach(Segments.allCases, id: \.self) { segment in
                    Text(segment.rawValue)
                }
            }
            .pickerStyle(.segmented)
            
            List(filteredGoals) { goal in
                NavigationLink {
                    DetailView(goal: goal)
                } label: {
                    HStack {
                        Image(systemName: goal.completed ? "checkmark.square" : "square")
                        Text(goal.title)
                    }
                    .font(.title2)
                }
                .swipeActions {
                    Button("", systemImage: "trash", role: .destructive) {
                        modelContext.delete(goal)
                        guard let _ = try? modelContext.save() else {
                            print("😡 ERROR: Delete on Bucket List View did not work.")
                            return
                        }
                    }
                }
            }
            .navigationTitle("Bucket List:")
            .listStyle(.plain)
            .sheet(isPresented: $isSheetPresented) {
                NavigationStack {
                    DetailView(goal: Goal())
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        isSheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    BucketListView()
        .modelContainer(Goal.preview)
}
