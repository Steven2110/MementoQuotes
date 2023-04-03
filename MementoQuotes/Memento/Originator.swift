//
//  Originator.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 29.03.2023.
//

import UIKit

class Originator  {
    var quote: Quote
    var imageData: ImageBG
    var image: UIImage = UIImage()
    
    init(quote: Quote, image: ImageBG) {
        self.quote = quote
        self.imageData = image
        NetworkManager.loadData(url: URL(string: image.urls.full)!) { dImage in
            if let dImage {
                self.image = dImage
            }
        }
    }
    
    func setState(state: (Quote, ImageBG, UIImage)) {
        quote = state.0
        imageData = state.1
        image = state.2
    }
    
    func save() -> Memento {
        return QuoteImageMemento(quote: quote, image: imageData, myImage: image)
    }
    
    func restore(memento: Memento) {
        guard let memento = memento as? QuoteImageMemento else { return }
        self.quote = memento.quote
        self.imageData = memento.imageData
        self.image = memento.image
    }
}

