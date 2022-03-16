//
//  PulseViewController.swift
//  HomeWork10
//
//  Created by 1 on 15.03.22.
//

import UIKit

class PulseViewController: UIViewController{
    
    private var animationCounter = 0
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var numberOfHeartBeats: UIStepper!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var beatsString: UITextField!
    

    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    
    @IBAction func numberOfHeartBeatsAction(_ sender: UIStepper) {
        beatsString.text = "Кол-во ударов: \(String(Int(numberOfHeartBeats.value)))"
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startButton.addTarget(self, action: #selector(heartBeat), for: .touchUpInside)
        
    }
    
    @objc private func heartBeat() {
        UIView.animate(withDuration: 1, delay: 0, options: [.curveEaseInOut], animations: {
            self.imageHeight.constant += 30
            self.imageWidth.constant += 30
            self.view.layoutIfNeeded()
        
        }, completion:  {_ in
            self.imageHeight.constant -= 30
            self.imageWidth.constant -= 30
            self.view.layoutIfNeeded()
            self.animationCounter += 1
            if (self.animationCounter < Int(self.numberOfHeartBeats.value)) {
                self.heartBeat()
            } else {
                self.animationCounter = 0
            }
        })
    }

}
