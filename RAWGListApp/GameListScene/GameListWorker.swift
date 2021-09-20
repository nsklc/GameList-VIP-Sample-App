//
//  GameListWorker.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import UIKit

class GameListWorker {
    var gamesListWorkerDelegate: GamesListDataDelegate?
    
    func getGames() {
        gamesListWorkerDelegate?.didStartGettingListOfGames()
        GameService().getListOfGames { gameList in
            if let gameList = gameList {

                self.gamesListWorkerDelegate?.didFinishGettingListOfGames(games: gameList)
            } else {
                //?
            }
        }
    }
}
