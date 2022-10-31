//
//  GameListWorker.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import UIKit

class GameListWorker {
    var gamesListWorkerDelegate: GamesListDataDelegate?
    
    func getGames(pageNumber: Int = 1) {
        gamesListWorkerDelegate?.didStartGettingListOfGames()
        GameService.shared.getListOfGames(pageNumber: pageNumber) { [weak self] result in
            switch result {
            case .success(let gameList):
                self?.gamesListWorkerDelegate?.didFinishGettingListOfGames(games: gameList)
            case .failure(let error):
                print(error)
            }
        }
    }
}
