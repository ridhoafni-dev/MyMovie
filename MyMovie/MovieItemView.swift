//
//  MovieItemView.swift
//  MyMovie
//
//  Created by User on 24/10/26.
//

import SwiftUI

struct MovieItemView: View {
    var movie: Movie
    var body: some View {
        HStack {
            AsyncImage(url: movie.posterPath) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }.frame(width: 80, height: 80)
            
            Text(movie.title)
                .font(.system(size: 20))
        }.padding([.top, .leading, .trailing])
    }
}

#Preview {
    MovieItemView(
        movie: movies[0]
    )
}
