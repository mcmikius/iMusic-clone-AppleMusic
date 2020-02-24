//
//  LibraryView.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 19.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI

struct LibraryView: View {
    @State var tracks = UserDefaults.standard.savedTracks()
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            
                        }) {
                            Image(systemName: "play.fill").frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color(UIColor.systemPink)).background(Color(UIColor.systemGroupedBackground)).cornerRadius(10)
                        }
                        Button(action: {
                            
                        }) {
                            Image(systemName: "arrow.2.circlepath").frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color(UIColor.systemPink)).background(Color(UIColor.systemGroupedBackground)).cornerRadius(10)
                        }
                    }
                }.padding().frame(height: 50)
                Divider().padding(.leading).padding(.trailing)
                List {
                    ForEach(tracks) { track in
                        LibraryRowView(cell: track)
                    }.onDelete(perform: delete)
                }
            }.navigationBarTitle("Library")
        }
    }
    
    func delete(at offsets: IndexSet) {
        tracks.remove(atOffsets: offsets)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
