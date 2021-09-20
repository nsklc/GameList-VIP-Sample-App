//
//  GameDetailsPresenter.swift
//  RAWGDetailsApp
//
//  Created by Enes Kılıç on 20.09.2021.
//

import UIKit

protocol GameDetailsPresentationLogic {
    func presentFetchedGames(gameDetails: GameDetailsModel)
}

class GameDetailsPresenter: GameDetailsPresentationLogic {
    weak var viewController: GameDetailsDisplayLogic?
    
    func presentFetchedGames(gameDetails: GameDetailsModel) {
        viewController?.displayFetchedGamesDetails(gameName: gameDetails.name, gameMetacritic: gameDetails.metacritic, gameRating: gameDetails.rating, gameReleased: gameDetails.released, gameDescription: gameDetails.description)
    }
    
}
