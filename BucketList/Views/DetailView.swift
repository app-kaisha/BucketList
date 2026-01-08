//
//  DetailView.swift
//  BucketList
//
//  Created by app-kaihatsusha on 08/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    
    @State var goal: Goal
    @State private var title = ""
    @State private var notes = ""
    @State private var isCompleted = false
    @State private var completedOn = Date()
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Goal:")
                .bold()
            TextField("goal", text: $title)
                .textFieldStyle(.roundedBorder)
            Text("Notes:")
                .bold()
            TextField("notes", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                
            Toggle("Completed?", isOn: $isCompleted)
                .bold()
                .padding(.bottom)
            if isCompleted {
                DatePicker("Completed on:", selection: $completedOn, displayedComponents: .date)
                    .bold()
            }
            
            Spacer()
            
        }
        .padding(.horizontal)
        .font(.title2)
        .onAppear {
            title = goal.title
            notes = goal.notes
            isCompleted = goal.completed
            completedOn = goal.completedOn
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel", systemImage: "xmark.circle.fill") {
                    dismiss()
                }
                .tint(.red)
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save", systemImage: "checkmark.circle.fill") {
                    goal.title = title
                    goal.notes = notes
                    goal.completed = isCompleted
                    goal.completedOn = completedOn
                    
                    modelContext.insert(goal)
                    
                    guard let _ = try? modelContext.save() else {
                        print("😡 ERROR: Save on DetailView did not work.")
                        return
                    }
                    
                    dismiss()
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        DetailView(goal: Goal(title: "Fit Healthcare", notes: "Difficult but doable", completed: false, completedOn: Date()))
            .modelContainer(for: Goal.self, inMemory: true)
    }
}
