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
    
    @Environment(\.modelContext) var modelContext
    @Query var goals: [Goal]
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(goals) { goal in
                    Text(goal.title)
                        .font(.title2)
                }
            }
            .navigationTitle("Bucket List:")
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        //TODO: confirmationAction
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
