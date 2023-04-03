//
//  QuoteModel.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 20.03.2023.
//

import Foundation

struct Quote: Codable {
    let id: String
    let content: String
    let author: String
    let authorSlug: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case content = "content"
        case author = "author"
        case authorSlug = "authorSlug"
    }
}

struct DefaultQuote {
    static let quote: Quote = Quote(
        id: "111",
        content: "nil",
        author: "nil",
        authorSlug: "nil"
    )
}
