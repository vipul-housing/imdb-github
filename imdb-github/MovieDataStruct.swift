//
//  MovieDataStruct.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 20/10/23.
//

import SwiftUI

struct MovieListFromJSON: Hashable, Decodable{
    
    let results: [MovieDataStruct]
}

struct MovieDataStruct: Hashable, Decodable{
    
    let backdrop_path:  String?
    let overview:       String?
    let popularity:     Double?
    let poster_path:    String?
    let release_date:   String?
    let title:          String?
    let vote_average:   Double?
}

struct Sample{
    
    static let sampleMovieDataStruct = MovieDataStruct(backdrop_path: "/rMvPXy8PUjj1o8o1pzgQbdNCsvj.jpg",
                                                overview: "Armed with every weapon they can get their hands on and the skills to use them, The Expendables are the world’s last line of defense and the team that gets called when all other options are off the table. But new team members with new styles and tactics are going to give “new blood” a whole new meaning.",
                                                popularity: 2085.194,
                                                poster_path: "/mOX5O6JjCUWtlYp5D8wajuQRVgy.jpg",
                                                release_date: "2023-09-15",
                                                title: "Expend4bles",
                                                vote_average: 6.3)
    
}
