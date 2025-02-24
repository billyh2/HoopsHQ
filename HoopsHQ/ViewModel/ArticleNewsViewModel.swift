//
//  ArticleNewsViewModel.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/24.
//

import SwiftUI

enum DataFetchPhase<T> {
    
    case empty
    case success(T)
    case failure(Error)
}

struct FetchTaskToken: Equatable {
    var category: Category
    var token: Date
}

@MainActor
class ArticleNewsViewModel: ObservableObject {
    
    @Published var phase = DataFetchPhase<[Article]>.empty
    @Published var fetchTaskToken: FetchTaskToken
    private let newsAPI = NewsAPI.shared
    
    init(articles: [Article]? = nil, selectedCategory: Category = .general) {
        if let articles = articles {
            self.phase = .success(articles)
        } else {
            self.phase = .empty
        }
        self.fetchTaskToken = FetchTaskToken(category: selectedCategory, token: Date())
    }
    
    //fetch article data
    func loadArticles() async {
        phase = .empty
        do {
            let articles = try await newsAPI.fetch(from: fetchTaskToken.category)
            phase = .success(articles)
            
        } catch {
            phase = .failure(error)
        }
    }
}
