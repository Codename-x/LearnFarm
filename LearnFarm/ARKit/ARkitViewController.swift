//
//  ARkitViewController.swift
//  LearFarm
//
//  Created by Michele Colelli Riano on 22/02/2018.
//  Copyright © 2018 Mik Colelli Riano. All rights reserved.
//

import UIKit
import ARKit
import AVFoundation

class ARkitViewController: UIViewController, ARSCNViewDelegate {
    
    var seconds = 7
    var timer = Timer()
    var isTimerRunning = false
    
    @IBOutlet weak var raccoglitoreButton: UIButton!
    @IBOutlet weak var infoRaccoglitore: UIView!
    @IBOutlet weak var infoRaccoglitoreLabel: UILabel!
    @IBOutlet weak var infoRaccoglitoreImage: UIImageView!
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ARkitViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1     //This will decrement(count down)the seconds.
        if seconds == 0 {
            labelDetect.isHidden = true
        }
    }
    
    @IBAction func raccoglitoreButton(_ sender: Any) {
        if infoRaccoglitore.isHidden ==  false{
            infoRaccoglitore.isHidden = true
        }else{
            if PopUpViewController.sharedPopUp.raccoglitoreImage.isEmpty == true {
                infoRaccoglitoreLabel.text = "ne truat nient "
            }else{
            infoRaccoglitoreLabel.text = "You have found "
             infoRaccoglitoreImage.image = PopUpViewController.sharedPopUp.raccoglitoreImage[0]
            }
            infoRaccoglitore.isHidden = false
        }
    }
    
    static let share = ARkitViewController()
    
    var nodeName: String = ""
    
    
    @IBOutlet weak var ARScene: ARSCNView!
    
    @IBOutlet weak var labelDetect: UILabel!
    

    let cowNodeName = ["COWBODY_003", "COWBODY_002", "COWBODY_001"]
    let sheepNodeName = ["Sheep_006", "Sheep_005", "Sheep_003", "Sheep_002", "Sheep_001", "Sheep"]
    let pigNodeName = ["pig_004", "pig_003", "pig_002", "pig"]
    let chickenNodeName = ["Chicken3","Chicken3","Chicken2"]
    let horseNodeName = ["HORSE"]
    let catNode = ["cat"]
    let dogNode = ["Dog"]
    let goatNode = ["Goat_003","Goat_002","Goat_001","Goat"]
    let boarNode = ["Boar","Boar_001"]
    
    let animalNode = ["HORSE1","COWBODY","Sheep_004","pig_001","Chicken1"]
    let configuration = ARWorldTrackingConfiguration()
    var showed: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        raccoglitoreButton.isHidden = true
        infoRaccoglitore.isHidden = true
        setLabelBorders(aLabel: labelDetect)
        labelDetect.text = "For Initializing the AR session, move to find a horizontal surface"
        
        //        self.ARScene.debugOptions = [ARSCNDebugOptions.showWorldOrigin, ARSCNDebugOptions.showFeaturePoints]
        self.configuration.planeDetection = .horizontal
        self.ARScene.session.run(configuration)
        self.ARScene.delegate = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.ARScene.addGestureRecognizer(tapGestureRecognizer)
        // Do any additional setup after loading the view, typically from a nib.
        runTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    //    tap recognizer function
    
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let sceneViewTappedOn = sender.view as! SCNView
        let touchCoordinates = sender.location(in: sceneViewTappedOn)
        let hitTest = sceneViewTappedOn.hitTest(touchCoordinates)
        if hitTest.isEmpty {
            print("didn't touch anything")
        } else {
            let results = hitTest.first!
            let node = results.node
            if node.name != nil {
                
                if cowNodeName.contains(node.name!) {
                    playSound(sound: "Cow")
                }
                
                if animalNode.contains(node.name!){
                    ARkitViewController.share.nodeName = node.name!
                    
                    let viewController:UIViewController = UIStoryboard(name: "ARkit", bundle: nil).instantiateViewController(withIdentifier: "PopUp") as UIViewController
                    
                    let modalStyle: UIModalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    viewController.modalTransitionStyle = modalStyle
                    self.present(viewController, animated: true, completion: nil)
                }
                
                
                if sheepNodeName.contains(node.name!) {
                    playSound(sound: "Sheep")
                }
                
                
                if dogNode.contains(node.name!) {
                    playSound(sound: "versocane")
                }
                
                
                if catNode.contains(node.name!) {
                    playSound(sound: "versogatto")
                }
                
                
                
                if pigNodeName.contains(node.name!) {
                    playSound(sound: "Pig")
                }
                
                if boarNode.contains(node.name!) {
                    playSound(sound: "versocinghiale")
                }
                if goatNode.contains(node.name!) {
                    playSound(sound: "versocapra")
                }
                
                
                
                
                if chickenNodeName.contains(node.name!) {
                    playSound(sound: "Chicken")
                }
                
                if horseNodeName.contains(node.name!) {
                    playSound(sound: "Horse")
                    
                }
                
            }
            
        }
    }
    
    
    //    plane anchor
    
    func createFarm(planeAnchor: ARPlaneAnchor) -> SCNNode {
        let scene = SCNScene(named: "Art.scnassets/maps.scn")
        let node = (scene?.rootNode.childNode(withName: "start", recursively: false))!
        node.position = SCNVector3(planeAnchor.center.x,planeAnchor.center.y + 0.8,planeAnchor.center.z)
        //node.eulerAngles = SCNVector3(180.degreesToRadians, 0, 0)
        return node
    }
    
    //     rendering
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if showed == false {
            guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
            let farmNode = createFarm(planeAnchor: planeAnchor)
            //        let cowNode = addNode(planeAnchor: planeAnchor, path: "Models.scnassets/mucca.scn", name: "Mucca")
            node.addChildNode(farmNode)
            //        node.addChildNode(cowNode)
            raccoglitoreButton.isHidden = false
            print("new flat surface detected, new ARPlaneAnchor added")
            showed = true
        }
        
    }
    
    
    
    // audio function
    
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
    
    
    public func setLabelBorders(aLabel: UILabel){
        
        aLabel.layer.masksToBounds = true
        aLabel.layer.cornerRadius = 10
//        aLabel.layer.borderWidth = 2
//        aLabel.layer.borderColor = UIColor.white.cgColor
    
        
        
    }
    
    
}

