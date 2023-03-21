//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    

    let eggTime = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var player: AVAudioPlayer!
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var labelTitle: UILabel!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.currentTitle
        var seconds = eggTime[hardness!]!
        let progress = 1.0/Float(seconds)
        self.progressBar.progress = 0.0
        
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            timer in seconds -= 1
            if seconds == 0 {
                self.progressBar.progress += progress
                self.labelTitle.text = "ACABOU!!"
                self.playSound()
                timer.invalidate()
            } else {
                self.progressBar.progress += progress
                print(seconds)
            }
        }
        
        print(eggTime[hardness!])
        
    }
    
    func playSound() {
           let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
           player = try! AVAudioPlayer(contentsOf: url!)
           player.play()
                   
       }
    
}
    
