//
//  LibraryRowView.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 19.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import URLImage

struct LibraryRowView: View {
    var cell: SearchViewModel.Cell
    var body: some View {
        HStack {
            URLImage(URL(string: cell.iconUrlString ?? "")!) { (proxy) in
                proxy.image.resizable().scaledToFit().cornerRadius(2)
            }.frame(width: 60, height: 60)
//            URLImage(URL(string: cell.iconUrlString ?? "")!).resizable().scaledToFit().frame(width: 60, height: 60).cornerRadius(2)
            VStack(alignment:.leading) {
                Text("\(cell.trackName)")
                Text("\(cell.artistName)")
            }
        }
    }
}

struct LibraryRowView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryRowView(cell: .init(iconUrlString: "", trackName: "Some track", artistName: "some artist", collectionName: "", previewUrl: ""))
    }
}
