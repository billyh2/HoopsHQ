//
//  ArticleSearchViewModel.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/3/3.
//

import SwiftUI

@MainActor
class ArticleSearchViewModel: ObservableObject {
    
    @Published var phase: DataFetchPhase<[Article]> = .empty
    @Published var searchQuery = ""
    @Published var history = [String]()
    private let historyDataStore = PListDataStore<[String]>(filename: "histories")
    
    private let historyMaxLimit = 10
    
    private let newsAPI = NewsAPI.shared
    
    static let shared = ArticleSearchViewModel()
    
    private init() {
        load()
    }
    
    func addHistory(_ text: String) {
        if let index = history.firstIndex(where: { text.lowercased() == $0.lowercased() }) {
            history.remove(at: index)
        } else if history.count == historyMaxLimit {
            history.remove(at: history.count-1)
        }
        
        history.insert(text, at: 0)
        historiesUpdated()
    }
    
    func removeHistory(_ text: String) {
        guard let index = history.firstIndex(where: { text.lowercased() == $0.lowercased() })
        else {
            return
        }
        history.remove(at: index)
        historiesUpdated()
    }
    
    func removeAllHistory() {
        history.removeAll()
        historiesUpdated()
    }
    
    func searchArticle() async {
        if Task.isCancelled { return }
        let searchQuery = self.searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        phase = .empty
        
        if searchQuery.isEmpty {
            return
        }
        
        do {
            let articles = try await newsAPI.search(for: searchQuery)
            if Task.isCancelled { return }
            if searchQuery != self.searchQuery {
                return
            }
            phase = .success(articles)
        } catch {
            if Task.isCancelled { return }
            if searchQuery != self.searchQuery {
                return
            }
            phase = .failure(error)
        }
    }
    
    private func load() {
        async {
            self.history = await historyDataStore.load() ?? []
        }
    }
    
    private func historiesUpdated() {
        let history = self.history
        async {
            await historyDataStore.save(history)
        }
    }
}

