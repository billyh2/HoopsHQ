//
//  EmptyPlaceholderView.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/24.
//

import SwiftUI

struct EmptyPlaceholderView: View {
    
    let text: String
    let image: Image?
    
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image = self.image {
                image
                    .imageScale(.large)
                    .font(.system(size: 52))
            }
            Text(text)
            Spacer()
        }
    }
}

//struct EmptyPlaceholderViewPreview: PreviewProvider {
//    
//    static var preview: some View {
//        EmptyPlaceholderView(text: "No Bookmarks", image: Image(systemName: "bookmark"))
//    }
//}
