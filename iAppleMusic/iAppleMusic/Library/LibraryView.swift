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
    @State private var showingAlert: Bool = false
    @State private var track: SearchViewModel.Cell!
    var tabBarDelegate: MainTabBarControllerDelegate?
    
    var body: some View {
        NavigationView {
            VStack {
                GeometryReader { geometry in
                    HStack(spacing: 20) {
                        Button(action: {
                            self.track = self.tracks[0]
                            self.tabBarDelegate?.maximizedTrackDetailController(viewModel: self.track)
                        }) {
                            Image(systemName: "play.fill").frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color(UIColor.systemPink)).background(Color(UIColor.systemGroupedBackground)).cornerRadius(10)
                        }
                        Button(action: {
                            self.tracks = UserDefaults.standard.savedTracks()
                        }) {
                            Image(systemName: "arrow.2.circlepath").frame(width: geometry.size.width / 2 - 10, height: 50).accentColor(Color(UIColor.systemPink)).background(Color(UIColor.systemGroupedBackground)).cornerRadius(10)
                        }
                    }
                }.padding().frame(height: 50)
                Divider().padding(.leading).padding(.trailing)
                List {
                    ForEach(tracks) { track in
                        LibraryRowView(cell: track).gesture(LongPressGesture().onEnded{ _ in
                            self.track = track
                            self.showingAlert = true
                        }.simultaneously(with: TapGesture().onEnded{ _ in
                            let keyWindow = UIApplication.shared.connectedScenes.filter({
                                $0.activationState == .foregroundActive
                                }).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first
                            let tabBarViewController = keyWindow?.rootViewController as? MainTabBarController
                            tabBarViewController?.trackDetailView.delegate = self
                            self.track = track
                            self.tabBarDelegate?.maximizedTrackDetailController(viewModel: self.track)
                        }))
                    }.onDelete(perform: delete)
                }
            }.actionSheet(isPresented: $showingAlert, content: { ActionSheet(title: Text("Are you sure you want to delete this track?"), buttons: [.destructive(Text("Delete"), action: {
                self.delete(track: self.track)
            }), .cancel()])
            }).navigationBarTitle("Library")
        }
    }
    
    func delete(at offsets: IndexSet) {
        tracks.remove(atOffsets: offsets)
        if let savedData = try? NSKeyedArchiver.archivedData(withRootObject: tracks, requiringSecureCoding: false) {
            let userDefaults = UserDefaults.standard
            userDefaults.set(savedData, forKey: UserDefaults.favouriteTrackKey)
        }
    }
    
    func delete(track: SearchViewModel.Cell) {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else {
            return
        }
        tracks.remove(at: myIndex)
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

extension LibraryView: TrackMovingDelegate {
    
    func moveBackForPreviousTrack() -> SearchViewModel.Cell? {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else {
            return nil
        }
        var nextTrack: SearchViewModel.Cell
        if myIndex - 1 == tracks.count {
            nextTrack = tracks[tracks.count - 1]
        } else {
            nextTrack = tracks[myIndex - 1]
        }
        self.track = nextTrack
        return nextTrack
    }
    
    func moveForwardForPreviousTrack() -> SearchViewModel.Cell? {
        let index = tracks.firstIndex(of: track)
        guard let myIndex = index else {
            return nil
        }
        var nextTrack: SearchViewModel.Cell
        if myIndex + 1 == tracks.count {
            nextTrack = tracks[0]
        } else {
            nextTrack = tracks[myIndex + 1]
        }
        self.track = nextTrack
        return nextTrack
    }
    
    
}
