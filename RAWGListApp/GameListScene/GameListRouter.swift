//
//  GameListRouter.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import UIKit

class GameListRouter {
    
    weak var viewController: GameListViewController?
    
    // MARK: Routing
    
    func routeToGameDetails(gameID: Int) {
        let newViewController = GameDetailsViewController()
        newViewController.modalPresentationStyle = .fullScreen
        newViewController.gameID = gameID
        viewController?.navigationController?.pushViewController(newViewController, animated: true)
    }
}
