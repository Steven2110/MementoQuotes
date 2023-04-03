//
//  NetworkManager.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 30.03.2023.
//

import UIKit

class NetworkManager: Any {
    static func loadData(url: URL, completion:@escaping (UIImage?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            completion(UIImage(data: data))
        }.resume()
    }
}
