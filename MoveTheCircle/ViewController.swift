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
    var textInCircle: UILabel!
    let directionCircle: DirectionCircle = .center
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleFromCode = UIView()
        circleFromCode.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        circleFromCode.layer.cornerRadius = circleFromCode.frame.width / 2
        circleFromCode.center.x = fieldForCircleView.frame.width / 2
        circleFromCode.center.y = fieldForCircleView.frame.height / 2
        circleFromCode.backgroundColor = .blue
        fieldForCircleView.addSubview(circleFromCode)
        
        textInCircle = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        textInCircle.center.x = circleFromCode.frame.width / 2
        textInCircle.center.y = circleFromCode.frame.height / 2
        //textInCircle.text = "CENTER"
        textInCircle.textColor = .black
        textInCircle.textAlignment = .center
        circleFromCode.addSubview(textInCircle)
        
    }
    
    @IBAction func upButtonPressed(_ sender: Any) {
        //moveCircleUp()
        moveCircle(direction: .up)
    }
    
    @IBAction func downButtonPressed(_ sender: Any) {
        //moveCircleDown()
        moveCircle(direction: .down)
    }
    
    @IBAction func rightButtonPressed(_ sender: Any) {
        //moveCircleRight()
        moveCircle(direction: .right)
    }
    
    @IBAction func leftButtonPressed(_ sender: Any) {
        //moveCircleLeft()
        moveCircle(direction: .left)
    }
    
    func moveCircle(direction: DirectionCircle) {
        switch direction {
        case .up:
            moveCircleUp()
        case .down:
            moveCircleDown()
        case .right:
            moveCircleRight()
        case .left:
            moveCircleLeft()
        default:
            print("kek")
        }
    }
    
    func moveCircleUp() {
        if circleFromCode.frame.origin.y - 5 >= 0 {
            circleFromCode.frame.origin.y -= 5
            textInCircle.text = "UP"
        } else {
            textInCircle.text = "Error"
        }
    }
    
    func moveCircleDown() {
        if circleFromCode.frame.origin.y + circleFromCode.frame.height + 5 <= fieldForCircleView.frame.height {
            circleFromCode.frame.origin.y += 5
            textInCircle.text = "DOWN"
        } else {
            textInCircle.text = "Error"
        }
    }
    
    func moveCircleRight() {
        if circleFromCode.frame.origin.x + circleFromCode.frame.width + 5 <= fieldForCircleView.frame.width {
            circleFromCode.frame.origin.x += 5
            textInCircle.text = "RIGHT"
        } else {
            textInCircle.text = "Error"
        }
    }
    
    func moveCircleLeft() {
        if circleFromCode.frame.origin.x - 5 >= 0 {
            circleFromCode.frame.origin.x -= 5
            textInCircle.text = "LEFT"
        } else {
            textInCircle.text = "Error"
        }
    }
    
}
