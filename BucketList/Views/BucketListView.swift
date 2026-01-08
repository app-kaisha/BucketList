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
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    BucketListView()
}
