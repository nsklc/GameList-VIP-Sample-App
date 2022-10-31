//
//  ViewController.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import UIKit

protocol GameListDisplayLogic: AnyObject {
    func displayFetchedGamesTitles(games: GameListModel)
}

class GameListViewController: UIViewController, GameListDisplayLogic {
    
    var interactor: GameListInteractor?
    var router: GameListRouter?
    
    var games: GameListModel?
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView
            .translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
   
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        setup()
        setupUI()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = GameListInteractor()
        let presenter = GameListPresenter()
        let router = GameListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        interactor.fetchGames()
    }
    
    func setupUI() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])
    }
    
    func displayFetchedGamesTitles(games: GameListModel) {
        if self.games != nil {
            self.games?.results += games.results
        } else {
            self.games = games
        }
        tableView.reloadData()
    }
    
}

// MARK: - UITableView Data Source
extension GameListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let games = games {
            return games.results.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        if let games = games {
            cell.textLabel?.text = games.results[indexPath.row].name
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let games = games {
            router?.routeToGameDetails(gameID: games.results[indexPath.row].id)
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let games = games, indexPath.row + 1 == games.results.count {
            interactor?.getNewPageForGames()
        }
    }
}

