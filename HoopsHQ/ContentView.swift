//
//  ContentView.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NewsTabView()
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
        }
    }
}

#Preview {
    ContentView()
}
