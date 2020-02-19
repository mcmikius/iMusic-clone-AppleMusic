//
//  TrackDetailView.swift
//  iAppleMusic
//
//  Created by Mykhailo Bondarenko on 19.02.2020.
//  Copyright © 2020 Mykhailo Bondarenko. All rights reserved.
//

import UIKit

class TrackDetailView: UIView {
    
    @IBOutlet weak var trackImageView: UIImageView!
    @IBOutlet weak var currentTimeSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var durationTimeLabel: UILabel!
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var authorTitleLabel: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        trackImageView.backgroundColor = .red
    }
    @IBAction func dragDownButtonTapped(_ sender: UIButton) {
        self.removeFromSuperview()
    }
    @IBAction func handleCurrentTimerSlider(_ sender: UISlider) {
    }
    @IBAction func handleVolumeSlider(_ sender: UISlider) {
    }
    @IBAction func previousTrack(_ sender: UIButton) {
    }
    @IBAction func nextTrack(_ sender: UIButton) {
    }
    @IBAction func playPauseAction(_ sender: UIButton) {
    }
}
