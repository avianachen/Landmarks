//
//  ContentView.swift
//  Landmarks
//
//  Created by cxq on 2025/3/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        LandmarkList()
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
