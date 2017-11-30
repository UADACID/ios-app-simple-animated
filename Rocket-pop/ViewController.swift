//
//  ViewController.swift
//  Rocket-pop
//
//  Created by pratama setya aji on 12/1/17.
//  Copyright © 2017 pratama setya aji. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var meluncurLbl: UILabel!
    @IBOutlet weak var onLbl: UILabel!
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        }catch let error as NSError {
            print(error.description)
        }
        
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 150, width: 375, height: 301)
        }) { (finished) in
            print("selesai")
            self.meluncurLbl.isHidden = false
            self.onLbl.isHidden = false
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        meluncurLbl.isHidden = true
        onLbl.isHidden = true
        cloudHolder.isHidden = true
        self.rocket.frame = CGRect(x:0, y:385, width: 375, height: 301)
        darkBlueBG.isHidden = false
        powerBtn.isHidden = false
        
    }
    
}

