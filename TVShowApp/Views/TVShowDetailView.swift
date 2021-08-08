//
//  TVShowDetailView.swift
//  TVShowApp
//
//  Created by Joshua Curry on 8/8/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct TVShowDetailView: View {
    var tvShow: TVShow
    var body: some View {
        ScrollView {
            VStack {
                WebImage(url: tvShow.image.original)
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .center) {
                    Spacer()
                    Text(tvShow.name)
                        .font(.largeTitle)
                    Spacer()
                    Text(tvShow.status)
                        .font(.title)
                    Spacer()
                    Text("\(tvShow.language)")
                        .font(.title)
                    Spacer()
                    List {
                        ForEach(tvShow.genres, id: \.self){ genre in
                            Text(genre)
                        }
                    }
                    Spacer()
                }
                
            }
        }
    }
}

//struct TVShowDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TVShowDetailView()
//    }
//}
