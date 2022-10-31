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
        
        GameService.shared.getGameDetails(gameID: gameID) { [weak self] result in
            switch result {
            case .success(let gameDetails):
                self?.gamesDetailsWorkerDelegate?.didFinishGettingDetailsOfGames(gameDetails: gameDetails)
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
