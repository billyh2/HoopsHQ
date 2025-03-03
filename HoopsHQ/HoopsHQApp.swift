//
//  HoopsHQApp.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/23.
//

import SwiftUI

@main
struct HoopsHQApp: App {
    
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
