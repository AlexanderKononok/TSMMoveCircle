//
//  ViewController.swift
//  MoveTheCircle
//
//  Created by Alexander Kononok on 9/16/20.
//  Copyright © 2020 Alexander Kononok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonsView: UIView!
    @IBOutlet weak var fieldForCircleView: UIView!
    
    var circleFromCode: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleFromCode = UIView()
        circleFromCode.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        circleFromCode.layer.cornerRadius = circleFromCode.frame.width / 2
        circleFromCode.center.x = fieldForCircleView.frame.width / 2
        circleFromCode.center.y = fieldForCircleView.frame.height / 2
        circleFromCode.backgroundColor = .blue
        fieldForCircleView.addSubview(circleFromCode)
        
    }

    @IBAction func upButtonPressed(_ sender: Any) {
        if circleFromCode.frame.origin.y - 5 >= 0 {
            circleFromCode.frame.origin.y -= 5
        }
    }
    
    @IBAction func downButtonPressed(_ sender: Any) {
        if circleFromCode.frame.origin.y + circleFromCode.frame.height + 5 <= fieldForCircleView.frame.height {
            circleFromCode.frame.origin.y += 5
        }
        
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        if circleFromCode.frame.origin.x + circleFromCode.frame.width + 5 <= fieldForCircleView.frame.width {
            circleFromCode.frame.origin.x += 5
        }
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        if circleFromCode.frame.origin.x - 5 >= 0 {
            circleFromCode.frame.origin.x -= 5
        }
    }
}

