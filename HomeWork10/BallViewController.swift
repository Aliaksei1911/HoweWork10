//
//  BallViewController.swift
//  HomeWork10
//
//  Created by 1 on 15.03.22.
//

import UIKit

class BallViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    private let sizeConst: CGFloat = 70
    
    var ballLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        initLabel()
        
        
    }
    
    func initLabel() {
        ballLabel = UILabel()
        ballLabel.frame.size = CGSize(width: sizeConst, height: sizeConst)
        ballLabel.layer.cornerRadius = sizeConst / 2
        ballLabel.backgroundColor = .white
        ballLabel.layer.masksToBounds = true
        ballLabel.center.x = view.center.x - 100
        ballLabel.center.y = view.center.y - 50
        self.view.addSubview(ballLabel)
    }
    
    func animateBall() {
        UIView.animate(withDuration: 1, animations: {
            self.ballLabel.center.x += 150
        }, completion: {_ in
            UIView.animate(withDuration: 1, animations: {
                self.ballLabel.center.y += 100
            }, completion: {_ in
                UIView.animate(withDuration: 1, animations: {
                    self.ballLabel.center.x -= 150
                    }, completion: {_ in
                        UIView.animate(withDuration: 1, animations: {
                            self.ballLabel.center.y -= 100
                        })
                    })
                })
            })
    }
  
    
}

    
        

