//
//  ViewController.swift
//  ShakeAndBreak
//
//  Created by Владислав Соколов on 12.09.2020.
//  Copyright © 2020 Владислав Соколов. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    private var fixed: UIImage!
    private var broken: UIImage!
    private var brokenScreenShowing = false
    private var crashPlayer: AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = Bundle.main.url(forResource: "glass", withExtension: "wav") {
            do {
                crashPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            } catch let error as NSError {
                print("Audio error! \(error.localizedDescription)")
            }
        }
        
        fixed = UIImage(named: "Home")
        broken = UIImage(named: "HomeBroken")
        imageView.image = fixed
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if !brokenScreenShowing && motion == .motionShake {
            imageView.image = broken
            crashPlayer?.play()
            brokenScreenShowing = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        imageView.image = fixed
        brokenScreenShowing = false
    }


}

