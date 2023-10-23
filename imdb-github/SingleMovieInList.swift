//
//  SingleMovieInList.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 20/10/23.
//

import SwiftUI

struct SingleMovieInList: View {
    
    let currentMovie: MovieDataStruct
    
    var body: some View{
        HStack {
            urlImage(urlString: currentMovie.backdrop_path ?? currentMovie.poster_path)
                .aspectRatio(contentMode: .fill)
                .frame(width: 65, height: 110)
                .cornerRadius(10)
                .padding(.leading, 10)

            
            VStack(alignment: .leading, spacing: 15) {
                Text(currentMovie.title ?? "No Title")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .scaledToFit()
                    .minimumScaleFactor(0.7)
                
                Text(currentMovie.overview ?? "No Overview")
                    .font(.body)
                    .foregroundColor(.gray)
                    .lineLimit(2)
            }
            .padding(.horizontal, 10)
        }
    }
}
