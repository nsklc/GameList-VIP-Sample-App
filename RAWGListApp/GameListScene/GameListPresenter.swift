//
//  GameListPresenter.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import UIKit

protocol GameListPresentationLogic {
    func presentFetchedGames(gameDetails: GameListModel)
}

class GameListPresenter: GameListPresentationLogic {
    weak var viewController: GameListDisplayLogic?
    
    func presentFetchedGames(gameDetails: GameListModel) {
        viewController?.displayFetchedGamesTitles(games: gameDetails)
    }
    
}
