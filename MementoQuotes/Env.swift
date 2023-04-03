//
//  Environment.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 20.03.2023.
//

import Foundation

enum Env {
    enum Keys {
        static let imageURL = "IMAGE_URL"
        static let quoteURL = "QUOTE_URL"
        static let apiKey = "API_KEY"
    }
    
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found!")
        }
        return dict
    }()
    
    static let imageURL: String = {
        guard let imageURLString = Env.infoDictionary[Keys.imageURL] as? String else {
            fatalError("Image URL not set in plist!")
        }
        return imageURLString
    }()
    
    static let apiKey: String = {
        guard let apiKeyString = Env.infoDictionary[Keys.apiKey] as? String else {
            fatalError("API key for image generator not set in plist!")
        }
        return apiKeyString
    }()
    
    static let quoteURL: String = {
        guard let quoteURLString = Env.infoDictionary[Keys.quoteURL] as? String else {
            fatalError("Quote URL not set in plist!")
        }
        return quoteURLString
    }()
}
