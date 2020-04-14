//
//  ViewController.swift
//  Move The Ball
//
//  Created by Nirob Hasan on 4/14/20.
//  Copyright © 2020 Nirob Hasan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var circelView: CircularView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupGestureRecoginzer()
    }
    
    private func setupGestureRecoginzer() {
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(panAction(gesture:)))
        pan.cancelsTouchesInView = false
        circelView.addGestureRecognizer(pan)
        circelView.isUserInteractionEnabled = true
    }
    
    @objc private func panAction(gesture: UIPanGestureRecognizer) {
        
        let translation = gesture.translation(in: view)

        guard let gestureView = gesture.view else {
          return
        }
        var xPosition = circelView.center.x
        if translation.x > 0 {
            xPosition = min(gestureView.center.x+translation.x, self.view.bounds.width-circelView.frame.height/2)
        }
        else {
            xPosition = max(gestureView.center.x+translation.x, circelView.frame.height/2)
        }
        
        gestureView.center = CGPoint(x: xPosition, y: gestureView.center.y)
        gesture.setTranslation(.zero, in: view)
    }
    
    @IBAction func moveCircleButtonAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5) {
            self.circelView.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
        }
    }

}

