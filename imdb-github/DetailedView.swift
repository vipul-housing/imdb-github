///
//  DetailedView.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 20/10/23.
//

import SwiftUI

struct DetailedView: View {
    
    var selectedMovie: MovieDataStruct{
        didSet{
            print("Acd")
        }
    }
    
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack {
                    
                    VStack(alignment: .leading){
                        
                        Spacer()
                        
                        HStack {
                            urlImage(urlString: selectedMovie.poster_path ?? selectedMovie.backdrop_path)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 165, height: 250)
                                .cornerRadius(10)
                                .padding(.leading, 10)
                            
                            VStack(alignment: .leading, spacing: 5){
                                Heading(title: "Release Date")
                                Content(data: selectedMovie.release_date ?? "YYYY--MM--DD")
                                
                                Spacer()
                                
                                Heading(title: "⭐️ Rating")
                                Content(data: "\(selectedMovie.vote_average ?? 0.0)")
                                
                                Spacer()
                                
                                Heading(title: "❤️ Popularity")
                                Content(data: "\(selectedMovie.popularity ?? 0.0)")
                            }
                        }
                        .frame(maxHeight: 210)
                        .padding(.vertical, 70)
                        
                        Heading(title: "Overview")
                            .fontWeight(.semibold)
                            .padding(.bottom)
                        
                        Content(data: selectedMovie.overview ?? "")
                        
                        Spacer()
                        Spacer()
                    }
                }
            }
            .navigationTitle(selectedMovie.title ?? "")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button{
                        isShowingDetailView = false
                    }label: {
                        HStack {
                            Image(systemName: "lessthan")
                            
                            Text("BACK")
                                .font(.body)
                        }
                    }
                }
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(selectedMovie: Sample.sampleMovieDataStruct, isShowingDetailView: .constant(false))
    }
}

struct Heading: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .foregroundColor(.gray)
            .padding(.horizontal, 20)
    }
}

struct Content: View {
    
    var data: String
    
    var body: some View {
        Text(data)
            .font(.body)
            .foregroundColor(.gray)
            .padding(.horizontal, 20)
    }
}

