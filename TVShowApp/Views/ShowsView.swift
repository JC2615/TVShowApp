//
//  ShowsView.swift
//  TVShowApp
//
//  Created by Joshua Curry on 8/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ShowsView: View {
    
    @ObservedObject var showViewModel = ShowViewModel()
    
    let columns = [
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16),
        GridItem(.flexible(minimum: 100, maximum: 200), spacing: 16)
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(showViewModel.shows) { show in
                        WebImage(url: show.image.medium)
                            .resizable()
                            //.placeholder(Image(systemName: "photo"))
                            .indicator(.activity)
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 150)
                            .cornerRadius(8.0)
                    }
                })
                .padding()
            }
            .navigationTitle("TV Shows")
            .onAppear(){
                showViewModel.fetchTVShows()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ShowsView()
    }
}
