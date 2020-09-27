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
  let step: CGFloat = 20.0
  
  
  
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
    textInCircle.textColor = .black
    textInCircle.textAlignment = .center
    circleFromCode.addSubview(textInCircle)
    
    let upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleSwipe(_:)))
    upSwipeGesture.direction = .up
    fieldForCircleView.addGestureRecognizer(upSwipeGesture)
    
    let downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleSwipe(_:)))
    downSwipeGesture.direction = .down
    fieldForCircleView.addGestureRecognizer(downSwipeGesture)
    
    let rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleSwipe(_:)))
    rightSwipeGesture.direction = .right
    fieldForCircleView.addGestureRecognizer(rightSwipeGesture)
    
    let leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(moveCircleSwipe(_:)))
    leftSwipeGesture.direction = .left
    fieldForCircleView.addGestureRecognizer(leftSwipeGesture)
    
  }
  
  @IBAction func upButtonPressed(_ sender: Any) {
    moveCircle(directionCircle: .up, step: step)
  }
  
  @IBAction func downButtonPressed(_ sender: Any) {
    moveCircle(directionCircle: .down, step: step)
  }
  
  @IBAction func rightButtonPressed(_ sender: Any) {
    moveCircle(directionCircle: .right, step: step)
  }
  
  @IBAction func leftButtonPressed(_ sender: Any) {
    moveCircle(directionCircle: .left, step: step)
  }
  
  func moveCircle(directionCircle: DirectionCircle, step: CGFloat) {
    switch directionCircle {
    case .up:
      if circleFromCode.frame.origin.y - step >= 0 {
        circleFromCode.frame.origin.y -= step
        textInCircle.text = "UP"
      } else {
        textInCircle.text = "Error"
      }
    case .down:
      if circleFromCode.frame.origin.y + circleFromCode.frame.height + step <= fieldForCircleView.frame.height {
        circleFromCode.frame.origin.y += step
        textInCircle.text = "DOWN"
      } else {
        textInCircle.text = "Error"
      }
    case .right:
      if circleFromCode.frame.origin.x + circleFromCode.frame.width + step <= fieldForCircleView.frame.width {
        circleFromCode.frame.origin.x += step
        textInCircle.text = "RIGHT"
      } else {
        textInCircle.text = "Error"
      }
    case .left:
      if circleFromCode.frame.origin.x - step >= 0 {
        circleFromCode.frame.origin.x -= step
        textInCircle.text = "LEFT"
      } else {
        textInCircle.text = "Error"
      }
    default:
      print("Error")
    }
  }
  
  @objc func moveCircleSwipe(_ swipeGesture: UISwipeGestureRecognizer) {
    switch swipeGesture.direction {
    case .up:
      //print("Swipe to up")
      if circleFromCode.frame.origin.y - step >= 0 {
        circleFromCode.frame.origin.y -= step
        textInCircle.text = "UP"
      } else {
        textInCircle.text = "Error"
      }
    case .down:
      //print("Swipe to down")
      if circleFromCode.frame.origin.y + circleFromCode.frame.height + step <= fieldForCircleView.frame.height {
        circleFromCode.frame.origin.y += step
        textInCircle.text = "DOWN"
      } else {
        textInCircle.text = "Error"
      }
    case .right:
      //print("Swipe to right")
      if circleFromCode.frame.origin.x + circleFromCode.frame.width + step <= fieldForCircleView.frame.width {
        circleFromCode.frame.origin.x += step
        textInCircle.text = "RIGHT"
      } else {
        textInCircle.text = "Error"
      }
    case .left:
      //print("Swipe to left")
      if circleFromCode.frame.origin.x - step >= 0 {
        circleFromCode.frame.origin.x -= step
        textInCircle.text = "LEFT"
      } else {
        textInCircle.text = "Error"
      }
    default:
      print("")
    }
  }
  
  
}
