//
//  GameListModel.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import Foundation

struct GameListModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    var results: [Results]
    
    init(count: Int, next: String?, previous: String?, results: [Results]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

struct Results: Codable {
    let id: Int
    let name, released, background_image: String
    let rating: Double
    let metacritic: Int?
    
    init(id: Int, name: String, released: String, background_image: String, number: Double, rating: Double, metacritic: Int?) {
        self.id = id
        self.name = name
        self.released = released
        self.background_image = background_image
        self.rating = rating
        self.metacritic = metacritic
    }
}
