//
//  NewsAPIResponse.swift
//  HoopsHQ
//
//  Created by Billy Huang on 2025/2/23.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    //Errors
    let code: String?
    let message: String?
    
}
