//
//  ShowViewModel.swift
//  TVShowApp
//
//  Created by Joshua Curry on 8/8/21.
//

import Foundation

class ShowViewModel: ObservableObject {
    @Published var shows: [TVShow] = []
    
    func fetchTVShows(){
        if let url = URL(string: "https://api.tvmaze.com/shows") {
            URLSession.shared.dataTask(with: url) { data, _, error in
                if let error = error {
                    print(error.localizedDescription)
                }
                else {
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let shows = try decoder.decode([TVShow].self, from: data)
                            self.shows = shows
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}
