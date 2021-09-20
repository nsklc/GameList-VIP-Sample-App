//
//  GameDetailsWorker.swift
//  RAWGDetailsApp
//
//  Created by Enes Kılıç on 20.09.2021.
//

class GameDetailsWorker {
    var gamesDetailsWorkerDelegate: GameDetailsDataDelegate?
    
    func getGames(gameID: Int) {
        gamesDetailsWorkerDelegate?.didStartGettingDetailsOfGames()
       
        GameService().getGameDetails(gameID: gameID) { gameDetails in
            if let gameDetails = gameDetails {
                self.gamesDetailsWorkerDelegate?.didFinishGettingDetailsOfGames(gameDetails: gameDetails)
            }
        }
    }
}
