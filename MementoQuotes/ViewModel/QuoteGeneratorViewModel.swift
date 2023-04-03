//
//  QuoteGeneratorViewModel.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 23.03.2023.
//

import UIKit

final class CaretakerViewModel: ObservableObject {
    @Published var quote: Quote = DefaultQuote.quote
    @Published var imageData: ImageBG = DefaultImage.image
    @Published var image: UIImage = UIImage()
    
    private var mementos: [Memento] = [Memento]()
    private var nextMementos: [Memento] = [Memento]()
    private var originator: Originator
    
    init(originator: Originator) {
        self.originator = originator
        self.backup()
        NetworkManager.loadData(url: URL(string: originator.imageData.urls.full)!) { image in
            if let image {
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
    
    func undo() {
        nextMementos.append(originator.save())
        guard !mementos.isEmpty else { return }
        let removedMemento: Memento = mementos.removeLast()
        
        originator.restore(memento: removedMemento)
        setNewState()
    }
    
    func next() {
        guard !nextMementos.isEmpty else { return }
        let removedMemento: Memento = nextMementos.removeLast()
        print("This is the removed memento: \(removedMemento)")
        originator.restore(memento: removedMemento)
        setNewState()
        backup()
    }

    func generate() {
        backup()
        loadData()
    }
    
    private func backup() {
        print("backing up....")
        mementos.append(originator.save())
        print(mementos)
    }
    
    private func setNewState() {
        let currentState = self.originator.save().getState()
        print("Current state: \(currentState)")
        self.quote = currentState.0
        self.imageData = currentState.1
        self.image = currentState.2
    }
    
    private func loadData() {
        var newImageData: ImageBG = DefaultImage.image
        var newQuote: Quote = DefaultQuote.quote
        var newImage: UIImage = UIImage()
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        getData(getImageAPIURL(), ImageBG.self) { data in
            newImageData = data
            NetworkManager.loadData(url: URL(string: data.urls.regular)!) { image in
                if let image {
                    newImage = image
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.enter()
        getData(getQuoteAPIURL(), Quote.self) { data in
            newQuote = data
            dispatchGroup.leave()
        }
        
        dispatchGroup.notify(queue: .main) {
            self.originator.setState(state: (newQuote, newImageData, newImage))
            self.setNewState()
        }
    }
}
