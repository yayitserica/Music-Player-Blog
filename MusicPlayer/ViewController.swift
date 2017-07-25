//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Erica Millado on 7/25/17.
//  Copyright © 2017 Erica Millado. All rights reserved.
//

import UIKit
//4 - 
import AVFoundation

class ViewController: UIViewController {
    
    //5 - 
    var songPlayer = AVAudioPlayer()
    //15 - 
    var hasBeenPaused = false
    
    //6 - 
    func prepareSongAndSession() {
        
        do {
            //7 - Insert the song from our Bundle into our AVAudioPlayer
            songPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "PurpleRain", ofType: "m4a")!))
            //8 - Prepare the song to be played
            songPlayer.prepareToPlay()
            
            //9 - Create an audio session
            let audioSession = AVAudioSession.sharedInstance()
            do {
                //10 - Set our session category to playback music
                try audioSession.setCategory(AVAudioSessionCategoryPlayback)
                //11 -
            } catch let sessionError {
                
                print(sessionError)
            }
            //12 -
        } catch let songPlayerError {
            print(songPlayerError)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //13
        prepareSongAndSession()
    }

    @IBAction func play(_ sender: Any) {
        //14
        songPlayer.play()
    }
 
    @IBAction func pause(_ sender: Any) {
        //16
        if songPlayer.isPlaying {
            songPlayer.pause()
            hasBeenPaused = true
        } else {
            hasBeenPaused = false
        }
    
    }

    @IBAction func restart(_ sender: Any) {
        //17 -
        if songPlayer.isPlaying || hasBeenPaused {
            songPlayer.stop()
            songPlayer.currentTime = 0
            
            songPlayer.play()
        } else  {
            songPlayer.play()
        }
    }

}






























