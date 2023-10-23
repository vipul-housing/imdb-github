//
//  urlImage.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 20/10/23.
//

import SwiftUI

struct urlImage: View {
    
    let urlString: String?
    @State var data: Data?
    
    var body: some View {
        
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
            }
        else {
            Image(systemName: "popcorn")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 65, height: 110)
                .cornerRadius(10)
                .padding(.leading, 10)
                .onAppear{
                    fetchImage()
                }
        }
    }
    
    private func fetchImage(){
        
        guard let safeURLString = urlString else{
            print("Image URL m dikkat h")
            return
        }
        
        let url = URL(string: "https://image.tmdb.org/t/p/w500\(safeURLString)")
        guard let safeURL = url else {
            print("Error in image url")
            return
        }
        
        let task = URLSession.shared.dataTask(with: safeURL){ imagedata, response, error in
            
            guard let imagedata = imagedata, error == nil else{
                print("Error in creating task")
                return
            }
            
            self.data = imagedata
        }
        task.resume()
    }
}
