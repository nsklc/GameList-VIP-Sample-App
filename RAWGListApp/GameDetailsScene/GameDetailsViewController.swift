//
//  GameDetailsViewController.swift
//  RAWGDetailsApp
//
//  Created by Enes Kılıç on 20.09.2021.
//

import UIKit

protocol GameDetailsDisplayLogic: AnyObject {
    func displayFetchedGamesDetails(gameName: String, gameMetacritic: Int?, gameRating: Double, gameReleased: String, gameDescription: String)
}

class GameDetailsViewController: UIViewController, GameDetailsDisplayLogic {
    
    var interactor: GameDetailsInteractor?
    
    var gameName: String?
    var gameMetacritic: Int?
    var gameRating: Double?
    var gameReleased: String?
    var gameDescription: String?
    
    var gameID: Int? {
        didSet {
            interactor?.fetchGameDetails(gameID: gameID!)
        }
    }
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        if let gameName = gameName, let gameMetacritic = gameMetacritic, let gameRating = gameRating, let gameReleased = gameReleased {
            nameLabel.text = gameName + "\n\(gameMetacritic)" + "\n\(gameRating)" + "\n\(gameReleased)"
        }
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return nameLabel
    }()
    
    lazy var gameDescriptionTextEdit: UITextView = {
        let gameDescriptionTextEdit = UITextView()
        
        nameLabel.numberOfLines = 0
        gameDescriptionTextEdit.isUserInteractionEnabled = false
        if let gameDescription = gameDescription {
            gameDescriptionTextEdit.text = gameDescription
        }
        
        gameDescriptionTextEdit.translatesAutoresizingMaskIntoConstraints = false
        
        return gameDescriptionTextEdit
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = GameDetailsInteractor()
        let presenter = GameDetailsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    func setupUI() {
        view.addSubview(nameLabel)
        view.addSubview(gameDescriptionTextEdit)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            
            gameDescriptionTextEdit.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            gameDescriptionTextEdit.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10),
            gameDescriptionTextEdit.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            gameDescriptionTextEdit.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    func displayFetchedGamesDetails(gameName: String, gameMetacritic: Int?, gameRating: Double, gameReleased: String, gameDescription: String) {
        self.gameName = gameName
        
        self.gameMetacritic = gameMetacritic
        
        self.gameRating = gameRating
        self.gameReleased = gameReleased
        self.gameDescription = gameDescription
        setupUI()
    }
 
    
}
