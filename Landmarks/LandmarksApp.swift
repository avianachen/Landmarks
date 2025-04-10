//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by cxq on 2025/3/24.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
