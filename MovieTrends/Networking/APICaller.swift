//
//  APICaller.swift
//  MovieTrends
//
//  Created by Akmaral Ergesh on 01.02.2024.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrendingMoives(
        completionHandler: @escaping (_ result: Result<TrendingMoviesModel, NetworkError>) -> Void) {
            if NetworkConstant.shared.apiKey.isEmpty {
                print("<!> API KEY is Missing <!>")
                print("<!> Get One from: https://www.themoviedb.org/ <!>")
                return
            }
            
            let urlString = NetworkConstant.shared.serverAddress +
            "trending/all/day?api_key=" +
            NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(Result.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, err in
                if err == nil,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(TrendingMoviesModel.self, from: data) {
                    completionHandler(.success(resultData))
                } else {
                    print(err.debugDescription)
                    completionHandler(.failure(.canNotParseData))
                }
            }.resume()
        }
}
