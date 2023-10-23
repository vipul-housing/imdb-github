//
//  MovieListContentView.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 20/10/23.
//

import SwiftUI

struct ContentView: View {
    
    var columns = [GridItem(.flexible())]
    
    @StateObject var viewModel = MovieListViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(viewModel.filteredListOfMovies, id: \.self) { movie in
                        SingleMovieInList(currentMovie: movie)
                            .onTapGesture {
                                viewModel.selectedMoview = movie
                            }
                    }
                }
                .padding(.bottom)
                .onAppear{
                    viewModel.fetchDataFromJSON()
                }
                .searchable(text: $viewModel.searchTerm, prompt: "Search Movies")
                
                HStack(spacing: 50) {
                    Button{
                        if viewModel.currentPageNo != 1 {
                            viewModel.currentPageNo = viewModel.currentPageNo - 1
                        }
                    } label: {
                        PrevButton(imageName: "lessthan", title: "Prev")
                    }
                    .disabled(viewModel.currentPageNo == 1)
                    
                    Button{
                        if viewModel.currentPageNo != viewModel.totalNoOFPages {
                            viewModel.currentPageNo = viewModel.currentPageNo + 1
                        }
                    } label: {
                        NextButton(imageName: "greaterthan", title: "Next")
                    }
                    .disabled(viewModel.currentPageNo == viewModel.totalNoOFPages - 1)
                }
            }
            .fullScreenCover(isPresented: $viewModel.isShowingDetailView){
                DetailedView(selectedMovie: viewModel.selectedMoview!, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            .navigationTitle("Movies")
        }
    }
}

struct MovieListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

