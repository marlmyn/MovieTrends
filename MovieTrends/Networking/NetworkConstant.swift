//
//  NetworkConstant.swift
//  MovieTrends
//
//  Created by Akmaral Ergesh on 01.02.2024.
//

import Foundation

class NetworkConstant {
    
    public static var shared: NetworkConstant = NetworkConstant()
    
    private init() {
        //singleton
    }
    
    public var apiKey: String {
        get {
            //API key from //https://api.themoviedb.org/
            return "10253efc2308e30e4e6438046479cfbd"
        }
    }
    public var serverAddress: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    
    public var imageServerAddress: String {
        get {
            return "https://image.tmdb.org/t/p/w500/"
        }
    }
}
