//
//  GameService.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import Alamofire
import Foundation

class GameService {
    
    static let shared = GameService()
    private init() { }
    
    var params: [String: Any] = ["key": APIContans.rawgGamesApiKey]

    let headers: HTTPHeaders = [
        "x-rapidapi-key": APIContans.rapidApiKey,
        "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com"
    ]
    
    func getListOfGames(pageNumber: Int, completionHandler: @escaping (Result<GameListModel, Error>) -> Void) {
        params["page"] = pageNumber
        
        AF.request(NSURL(string: "https://rawg-video-games-database.p.rapidapi.com/games")! as URL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
            switch response.result {
            case .success(_):
                do {
                    let games = try JSONDecoder().decode(GameListModel.self, from: response.data!)
                    completionHandler(.success(games))
                } catch let error as NSError {
                    debugPrint(error)
                    print("Failed to load: \(error.localizedDescription)")
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                print(error)
                completionHandler(.failure(error))
            }
        }
    }
    
    func getGameDetails(gameID: Int, completionHandler: @escaping (Result<GameDetailsModel, Error>) -> Void) {

        AF.request(NSURL(string: "https://rawg-video-games-database.p.rapidapi.com/games/\(gameID)")! as URL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).response { response in
            switch response.result {
            case .success(_):
                do {
                    let gameDetail = try JSONDecoder().decode(GameDetailsModel.self, from: response.data!)
//                    print(gameDetail.name)
                    completionHandler(.success(gameDetail))
                } catch let error as NSError {
                    debugPrint(error)
                    print("Failed to load: \(error.localizedDescription)")
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                print(error)
                completionHandler(.failure(error))
            }
        }

    }
    
}

