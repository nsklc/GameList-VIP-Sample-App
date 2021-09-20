//
//  GameService.swift
//  RAWGListApp
//
//  Created by Enes Kılıç on 19.09.2021.
//

import Alamofire
import Foundation

class GameService {
    
    var params: [String: Any] = ["key": "rawgkey"]
    
    let headers: HTTPHeaders = [
        "x-rapidapi-key": "rapidapi-key",
        "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com"
    ]
    
    func getListOfGames(completionHandler: @escaping (_ games: GameListModel?) -> Void) {
        
        params["page"] = 1
        
        AF.request(NSURL(string: "https://rawg-video-games-database.p.rapidapi.com/games")! as URL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(_):
                do {
                    let games = try JSONDecoder().decode(GameListModel.self, from: response.data!)
                    completionHandler(games)
                } catch let error as NSError {
                    debugPrint(error)
                    print("Failed to load: \(error.localizedDescription)")
                }
            case .failure(let error):
                print(error)
                completionHandler(nil)
            }
        }
        
    }
    
    func getGameDetails(gameID: Int, completionHandler: @escaping (_ gameDetail: GameDetailsModel?) -> Void) {

        AF.request(NSURL(string: "https://rawg-video-games-database.p.rapidapi.com/games/\(gameID)")! as URL, method: .get, parameters: params, encoding: URLEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success(_):
                do {
                    let gameDetail = try JSONDecoder().decode(GameDetailsModel.self, from: response.data!)
//                    print(gameDetail.name)
                    completionHandler(gameDetail)
                } catch let error as NSError {
                    debugPrint(error)
                    print("Failed to load: \(error.localizedDescription)")
                }
            case .failure(let error):
                print(error)
            }
        }

    }
    
}

