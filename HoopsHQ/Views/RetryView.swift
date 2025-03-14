//
//  RetryView.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/24.
//

import SwiftUI

struct RetryView: View {
    
    let text: String
    let retryAction: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryAction) {
                Text("Try again")
            }
        }
    }
}

//#Preview {
//    RetryView()
//}
