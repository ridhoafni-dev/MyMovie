//
//  ContentView.swift
//  MyMovie
//
//  Created by User on 24/10/26.
//

import SwiftUI

struct ContentView: View {
    @State var myMovies: [Movie] = []
    @State var isLoading = true
    @State var isEror = false
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView()
                Text("Sedang memuat data...")
                    .padding()
            }
            else {
                List {
                    ForEach(movies) { movie in
                        MovieItemView(movie: movie)
                    }
                }
            }
        }.task {
            let networkService = NetworkService()
            do {
                self.myMovies = try await networkService.getMovies()
                self.isLoading = false
                self.isEror = false
            } catch {
                self.isLoading = false
                self.isEror = true
                print("Error...")
            }
        }
        .alert("Gagal memuat data!", isPresented: $isEror) {
            Button("OK", role: .cancel) {}
        }
    }
}

#Preview {
    ContentView()
}
