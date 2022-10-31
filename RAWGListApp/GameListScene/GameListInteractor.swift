//
//  GameListInteractor.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import UIKit

protocol GameListBusinessLogic {
    func fetchGames()
    func getNewPageForGames()
}

protocol GamesListDataDelegate {
    func didStartGettingListOfGames()
    func didFinishGettingListOfGames(games: GameListModel)
}

class GameListInteractor: GameListBusinessLogic, GamesListDataDelegate {
    var presenter: GameListPresenter?
    var worker = GameListWorker()
    var games: GameListModel?
    var pageNumber = 1
    
    init() {
        worker.gamesListWorkerDelegate = self
    }
    
    func fetchGames() {
        worker.getGames()
    }
    
    func didStartGettingListOfGames() {
        print("didStartGettingListOfGames")
    }
    
    func didFinishGettingListOfGames(games: GameListModel) {
        print("didFinishGettingListOfGames")
        print(games)
        presenter?.presentFetchedGames(gameDetails: games)
    }
    
    func getNewPageForGames() {
        print("getNewPageForGames")
        pageNumber += 1
        worker.getGames(pageNumber: pageNumber)
    }
}

