//
//  ImageModel.swift
//  MementoQuotes
//
//  Created by Steven Wijaya on 21.03.2023.
//

import Foundation

struct ImageBG: Identifiable, Codable {
    let id: String
    let description: String?
    let alt_description: String
    let urls: ImageURL
}

struct ImageURL: Codable {
    let raw: String
    let full: String
    let regular: String
}

struct DefaultImage {
    static let image: ImageBG = ImageBG(
        id: "111",
        description: "nil",
        alt_description: "nil",
        urls: ImageURL(
            raw: "https://media.istockphoto.com/id/615508782/photo/lonely-chair-at-the-empty-room.jpg?s=612x612&w=0&k=20&c=0EV8enyJzeNBESjjKGtM4TIUSJD5buywvDtGDbE6t_4=",
            full: "https://media.istockphoto.com/id/615508782/photo/lonely-chair-at-the-empty-room.jpg?s=612x612&w=0&k=20&c=0EV8enyJzeNBESjjKGtM4TIUSJD5buywvDtGDbE6t_4=",
            regular: "https://media.istockphoto.com/id/615508782/photo/lonely-chair-at-the-empty-room.jpg?s=612x612&w=0&k=20&c=0EV8enyJzeNBESjjKGtM4TIUSJD5buywvDtGDbE6t_4="
        )
    )
}
