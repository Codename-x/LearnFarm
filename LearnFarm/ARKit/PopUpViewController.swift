//
//  PopUpViewController.swift
//  LearFarm
//
//  Created by Michele Colelli Riano on 22/02/2018.
//  Copyright © 2018 Mik Colelli Riano. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftVideoBackground

class PopUpViewController: UIViewController {
    
    static let sharedPopUp = PopUpViewController()
    
    let questionCow = ["Tomatoes cost 3,20 $ per Kilogram before Christmas and 2,75 $ per Kilogram after Christmas. \n How much has the price decreased? ","The farmer collected 96 carrots that he tied in bunches of 8 carrots each. \n How muny bunches will he get?","15 hens escaped from the henhouse. Inside there are 47. \n How many Hens were there in the henshouse?","A pack of flour cost 0,10$. How much are 8 packs?","The farmer collected 3 tens of apples. \n Are they more or less of 29 apples"]
    //let answerCow = [["0,55","5,95","3,20"],["12","8","15"],["32","25","40"],["0,80","1,20","0,60"],["More","Less","Same"]]
    let answerCow = ["0,45","12","32","0,80","More"]
    let animalNode = ["COWBODY", "HORSE1", "Chicken1", "Sheep_004", "pig_001"]
    let videoName = ["CowSfondo", "CavalloSfondo", "ChickenSfondo", "SheepSfondo", "PigSfondo"]
    let imageArray: [UIImage] = [
        UIImage(named: "cow_tomatoes.png")!,
        UIImage(named: "horse_carrots.png")!,
        UIImage(named: "chicken_eggs.png")!,
        UIImage(named: "sheep_wheat.png")!,
        UIImage(named: "pig_apple.png")!
    ]
    
    var raccoglitoreImage: [UIImage] = []
    
    var countErrati: Int = 0
    
    @IBOutlet weak var PopUpView: UIView!
    
    @IBOutlet weak var closeOutlet: UIButton!
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var answerText: UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    @IBAction func confirmButton(_ sender: Any) {
        
        if answerCow.contains(answerText.text!){
        PopUpView.isHidden = false
            
            for i in 0...4 {
                if ARkitViewController.share.nodeName == animalNode[i] {
                    PopUpView.backgroundColor = UIColor.clear
                    backGroundImage.image = imageArray[i]
                    PopUpViewController.sharedPopUp.raccoglitoreImage.append(imageArray[i])
                }
            }
        
        
        
//        if ARkitViewController.share.nodeName == "COWBODY" {
//
//            PopUpView.backgroundColor = UIColor.clear
//            backGroundImage.image = #imageLiteral(resourceName: "cow_tomatoes")
//
//        }else if ARkitViewController.share.nodeName == "HORSE1" {
//
//            PopUpView.backgroundColor = UIColor.clear
//            backGroundImage.image = #imageLiteral(resourceName: "horse_carrots")
//
//        }else if ARkitViewController.share.nodeName == "Chicken1" {
//
//            PopUpView.backgroundColor = UIColor.clear
//            backGroundImage.image = #imageLiteral(resourceName: "chicken_eggs")
//
//        }else if ARkitViewController.share.nodeName == "Sheep_004" {
//
//            PopUpView.backgroundColor = UIColor.clear
//            backGroundImage.image = #imageLiteral(resourceName: "sheep_wheat")
//
//        }else if ARkitViewController.share.nodeName == "pig_001" {
//
//            PopUpView.backgroundColor = UIColor.clear
//            backGroundImage.image = #imageLiteral(resourceName: "pig_apple")
//
//        }
        
        
        closeOutlet.isHidden = false
            self.dismiss(animated: true, completion: nil)
        }else{
            countErrati += 1
            
            if countErrati == 3 {
                print("par o cazz")
            }
        }
        
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(1.5)
        closeOutlet.isHidden = true
        PopUpView.backgroundColor = UIColor.white
        PopUpView.isHidden = true
        setViewBorders(aView: PopUpView)
        
        
        //        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        for i in 0...4 {
            if ARkitViewController.share.nodeName == animalNode[i] {
                try? VideoBackground.shared.play(
                    view: view,
                    name: videoName[i],
                    type: "mp4",
                    isMuted: false,
                    alpha: 0,
                    willLoopVideo: false
                )
            }
        }
        
        
//        if ARkitViewController.share.nodeName == "COWBODY" {
////            backGroundImage.image = #imageLiteral(resourceName: "Mucca.png")
////            playSound(sound: "cowQuestion")
//            try? VideoBackground.shared.play(
//                view: view,
//                name: "CowSfondo",
//                type: "mp4",
//                isMuted: false,
//                alpha: 0,
//                willLoopVideo: false
//            )
//        }
//
//        else if ARkitViewController.share.nodeName == "HORSE1" {
////            backGroundImage.image = #imageLiteral(resourceName: "cavallo.png")
////            playSound(sound: "horseQuestion")
//            try? VideoBackground.shared.play(
//                view: view,
//                name: "CavalloSfondo",
//                type: "mp4",
//                isMuted: false,
//                alpha: 0,
//                willLoopVideo: false
//            )
//        }
//
//        else if ARkitViewController.share.nodeName == "Chicken1" {
////            backGroundImage.image = #imageLiteral(resourceName: "Gallo.png")
////            playSound(sound: "chickenQuestion")
//            try? VideoBackground.shared.play(
//                view: view,
//                name: "ChickenSfondo",
//                type: "mp4",
//                isMuted: false,
//                alpha: 0,
//                willLoopVideo: false
//            )
//        }
//
//        else if ARkitViewController.share.nodeName == "Sheep_004" {
//
//            //            backGroundImage.loadGif(name: "gifsheep")
////            backGroundImage.image = #imageLiteral(resourceName: "pngpecora")
////            playSound(sound: "sheepQuestion")
//            try? VideoBackground.shared.play(
//                view: view,
//                name: "SheepSfondo",
//                type: "mp4",
//                isMuted: false,
//                alpha: 0,
//                willLoopVideo: false
//            )
//        }
//
//        else if ARkitViewController.share.nodeName == "pig_001" {
////            backGroundImage.image = #imageLiteral(resourceName: "Maiale.png")
////            playSound(sound: "PigQuestion")
//            try? VideoBackground.shared.play(
//                view: view,
//                name: "PigSfondo",
//                type: "mp4",
//                isMuted: false,
//                alpha: 0,
//                willLoopVideo: false
//            )
//        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    var player: AVAudioPlayer?
    
    func playSound(sound: String) {
        guard let url = Bundle.main.url(forResource: "Art.scnassets/" + sound, withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func setViewBorders(aView: UIView){
        
        aView.layer.masksToBounds = true
        aView.layer.cornerRadius = 20
//        aView.layer.borderWidth = 2
        //        aView.layer.borderColor = UIColor.black.cgColor
        //
        //        aView.layer.zPosition = 1
        
        
    }

}
