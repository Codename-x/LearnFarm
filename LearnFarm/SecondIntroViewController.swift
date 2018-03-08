//
//  SecondIntroViewController.swift
//  LearFarm
//
//  Created by Michele Colelli Riano on 22/02/2018.
//  Copyright © 2018 Mik Colelli Riano. All rights reserved.
//

import UIKit

import SwiftVideoBackground

class SecondIntroViewController: UIViewController {
    var seconds = 44
    var timer = Timer()
    var isTimerRunning = false
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(SecondIntroViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        if seconds == 0 {
           startButton1.isHidden = false
        }
        if seconds == 38 {
            skipButton.isHidden = false
        }
    }
    
   
    
    @IBAction func startButton(_ sender: Any) {
        
        
    }
    @IBAction func skipButton(_ sender: Any) {
        try? VideoBackground.shared.play(
            view: view,
            name: "VideoIntroduzione",
            type: "mp4",
            isMuted: true,
            alpha: 0,
            willLoopVideo: false
        )
    }
    
    @IBOutlet weak var startButton1: UIButton!
    @IBOutlet weak var skipButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton1.isHidden = true
        skipButton.isHidden = true
      
        try? VideoBackground.shared.play(
            view: view,
            name: "VideoIntroduzione",
            type: "mp4",
            isMuted: false,
            alpha: 0,
            willLoopVideo: false
        )
        
        runTimer()
//        try? VideoBackground.shared.play(view: view, name: "VideoIntroApp", type: "mp4")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
