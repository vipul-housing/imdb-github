//
//  MovieListViewModel.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 20/10/23.
//

import SwiftUI

class MovieListViewModel: ObservableObject{
    
    @Published var listOfMovies = [MovieDataStruct]()
    var searchTerm : String = "" {
        didSet{
            
        }
    }
    
    @Published var filteredListOfMovies = [MovieDataStruct]()
    
    @Published var isShowingDetailView : Bool = false
    
    @Published var currentPageNo = 1{
        didSet{
            fetchDataFromJSON()
        }
    }
    
    var totalNoOFPages = 109
    
    var selectedMoview : MovieDataStruct?{
        didSet{
            isShowingDetailView = true
        }
    }
    
    
    func fetchDataFromJSON(){
        let urlString = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=38a73d59546aa378980a88b645f487fc&language=en-US&page=\(currentPageNo)")
        
        guard let safeURLString = urlString else{
            print("The URL string is not correct")
            return
        }
        
        let task = URLSession.shared.dataTask(with: safeURLString){ data, response, error in
            
            guard let data = data , error == nil else {
                print("Error in creating URL session data task")
                return
            }
            
            var jsondata = [MovieDataStruct]()
            print("data")
            do{
                jsondata = try JSONDecoder().decode(MovieListFromJSON.self, from: data).results
            }
            catch{
                print("Error in decoding data")
                print(error)
            }
            DispatchQueue.main.async {
                self.listOfMovies = jsondata
                self.filteredListOfMovies = self.listOfMovies
            }
        }
        task.resume()
    }
}
