//
//  Memento.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 23.03.2023.
//

import UIKit

// All necessary class for Memento design pattern is in this file.

protocol Memento {
    var quote: Quote { get }
    var imageData: ImageBG { get }
    var image: UIImage { get }
    
    func getState() -> (Quote, ImageBG, UIImage)
}

class QuoteImageMemento: Memento {
    private (set) var quote: Quote
    private (set) var imageData: ImageBG
    private (set) var image: UIImage
    
    init(quote: Quote, image: ImageBG, myImage: UIImage) {
        self.quote = quote
        self.imageData = image
        self.image = myImage
    }
    
    func getState() -> (Quote, ImageBG, UIImage) {
        (quote, imageData, image)
    }
}

