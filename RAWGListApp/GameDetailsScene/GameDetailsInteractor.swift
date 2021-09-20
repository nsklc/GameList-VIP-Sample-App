//
//  GameDetailsInteractor.swift
//  RAWGDetailsApp
//
//  Created by Enes Kılıç on 20.09.2021.
//

import UIKit

protocol GameDetailsBusinessLogic {
    func fetchGameDetails(gameID: Int)
}

protocol GameDetailsDataDelegate {
    func didStartGettingDetailsOfGames()
    func didFinishGettingDetailsOfGames(gameDetails: GameDetailsModel)
}

class GameDetailsInteractor: GameDetailsBusinessLogic, GameDetailsDataDelegate {
        
    var presenter: GameDetailsPresenter?
    var worker = GameDetailsWorker()
    
    init() {
        worker.gamesDetailsWorkerDelegate = self
    }
    
    func fetchGameDetails(gameID: Int) {
        worker.getGames(gameID: gameID)
    }
    
    func didStartGettingDetailsOfGames() {
        print("didStartGettingDetailsOfGames")
        
    }
    
    func didFinishGettingDetailsOfGames(gameDetails: GameDetailsModel) {
        print("didFinishGettingDetailsOfGames")
        print(gameDetails)
        presenter?.presentFetchedGames(gameDetails: gameDetails)
    }
    
}


