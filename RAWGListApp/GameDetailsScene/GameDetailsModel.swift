//
//  GameDetailsModel.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 20.09.2021.
//

import Foundation

struct GameDetailsModel: Codable {
    let id: Int
    let name, background_image: String
    let released: String
    let rating: Double
    let metacritic: Int?
    let description: String
    
    init(id: Int, name: String, released: String, background_image: String, tba: Bool, rating: Double, metacritic: Int?, description: String) {
        self.id = id
        self.name = name
        self.released = released
        self.background_image = background_image
        self.rating = rating
        self.metacritic = metacritic
        self.description = description
    }
}
