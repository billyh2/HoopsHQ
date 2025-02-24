//
//  Category.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/24.
//

import Foundation

//differnet categories of news
enum Category: String, CaseIterable {
    case general
    case business
    case technology
    case entertainment
    case sports
    case science
    case health
    
    var text: String {
        if self == .general {
            return "Top Headlines"
        }
        return rawValue.capitalized
    }
}

extension Category: Identifiable {
    var id: Self { self }
}
