//
//  Article.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/23.
//

import Foundation

fileprivate let relativeDateFormatter = RelativeDateTimeFormatter()

struct Article: Codable, Equatable, Identifiable {

    let source: Source
    
    let title: String
    let author: String?
    let description: String?
    
    let url: String
    let publishedAt: Date
    let urlToImage: String?
    
    var id: String { url }
    
    var authorText: String {
        author ?? ""
    }
    
    var descriptionText: String {
        description ?? ""
    }
    
    var articleURL: URL {
        URL(string: url)!
    }
    
    var imageURL: URL? {
        guard let urlToImage = urlToImage else {
            return nil
        }
        return URL(string: urlToImage)
    }
    
    var captionText: String {
        "\(source.name) ∙ \(relativeDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
}

extension Article {
    //For preview testing
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiResponse = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiResponse.articles ?? []
    }
}

struct Source: Codable, Equatable {
    let name: String
}

