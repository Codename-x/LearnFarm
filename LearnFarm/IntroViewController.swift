//
//  ViewController.swift
//  LearFarm
//
//  Created by Michele Colelli Riano on 22/02/2018.
//  Copyright © 2018 Mik Colelli Riano. All rights reserved.
//

import UIKit
import Lottie

class IntroViewController: UIViewController {

    // var timer
    var seconds = 5
    var timer = Timer()
    var isTimerRunning = false
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(IntroViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        if seconds == 0 {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SBwelcome")
                self.present(vc!, animated: true, completion: nil)
            }
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let animationView = LOTAnimationView(name: "LogoAnimato2")
        animationView.frame = CGRect(x: 0, y: 0, width: 720, height: 480)
        animationView.center = self.view.center
      
        view.addSubview(animationView)
        
        animationView.play()
        // Do any additional setup after loading the view.
        runTimer()
    }
        
        // Do any additional setup after loading the view, typically from a nib.
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    }
