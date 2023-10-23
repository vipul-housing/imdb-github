//
//  PageChangeButtons.swift
//  imdb-SwiftUI
//
//  Created by Vipul Purbey on 21/10/23.
//

import SwiftUI

struct PrevButton: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        HStack {
            Image(systemName: imageName)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
        }
        .padding(.leading, 10)
    }
}

struct NextButton: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Image(systemName: imageName)
        }
        .padding(.leading, 10)
    }
}

