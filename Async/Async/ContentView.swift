//
//  ContentView.swift
//  Async
//
//  Created by yekta on 27.02.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            VStack {
                AsyncImage(url: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/Earth_poster_large.jpg/1600px-Earth_poster_large.jpg?20080517082911")!) { image in
                    image.resizable().frame(width:300, height: 300, alignment: .center)
                } placeholder: {
                    ProgressView() // foto gelene kadar yukleme efekti
                }

                List(superHeroArray){ superhero in
                    Text(superhero.name)
                        .font(.title3)
                }.navigationTitle("Superhero Book")
            }
        }
        
    }
}

#Preview {
    ContentView()
}
