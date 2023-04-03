//
//  Utils.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 20.03.2023.
//

import Foundation

func getQuoteAPIURL() -> String {
    Env.quoteURL
}

func getImageAPIURL() -> String {
    Env.imageURL + "/?client_id=\(getImageAPIKey())"
//    "https://api.unsplash.com/photos/random/?client_id="
}

func getImageAPIKey() -> String {
    Env.apiKey
}

func getData<DataKind:Codable>(_ url: String,_ dataKind: DataKind.Type, _ completion: @escaping (_ data:DataKind)->Void) {
    let url = URL(string: url)
    URLSession.shared.dataTask(with: url!) { data, response, error in
        if error == nil && data != nil {
            let convertedData = try! JSONDecoder().decode(dataKind, from: data!)
            completion(convertedData)
        }
    }.resume()
}
