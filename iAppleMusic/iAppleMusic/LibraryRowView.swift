//
//  LibraryRowView.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 19.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct LibraryRowView: View {
    var body: some View {
        HStack {
            Image("pic0").resizable().scaledToFit().frame(width: 60, height: 60).cornerRadius(2)
            VStack(alignment:.leading) {
                Text("Track Title")
                Text("Artist")
            }
        }
    }
}

struct LibraryRowView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryRowView()
    }
}
