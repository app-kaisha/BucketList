//
//  BucketListApp.swift
//  BucketList
//
//  Created by app-kaihatsusha on 08/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI
import SwiftData

@main
struct BucketListApp: App {
    var body: some Scene {
        WindowGroup {
            BucketListView()
                .modelContainer(for: Goal.self)
                
        }
    }
    
    init() {
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
