//
//  ViewController.swift
//  CrazyRollingBall
//
//  Created by techmaster on 1/9/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball: UIImageView = UIImageView()
    let ballRadius: CGFloat = 32.0
    var angle: CGFloat =  1 * CGFloat(M_PI/180)
    var oldCenterBall: CGPoint! = nil
    var newCenterBall: CGPoint! = nil
    var timer: Timer = Timer()
    var timerCheck: Timer = Timer()
    var timerRollBall: Timer = Timer()
    var temp = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        oldCenterBall = ball.center
        timer = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBallCenterToRight), userInfo: nil, repeats: true)
    }
    
    func addBall() {
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.frame.size = CGSize(width: ballRadius*2, height: ballRadius*2)
        ball.center = view.center
        view.addSubview(ball)
    }
    
    func rollBallCenterToRight() {
        ball.transform = ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y + ballRadius*angle)
        
        if ball.center.x >= view.bounds.size.width - ballRadius {
            timer.invalidate()
            startTimerCheck()
        }
    }
    
    func startTimerCheck() {
        timerCheck = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBallCheck), userInfo: nil, repeats: true)
    }
    
    func stopTimerCheck() {
        timerCheck.invalidate()
    }
    
    func rollBallCheck() {
        if ball.center.x >= view.bounds.size.width - ballRadius {
            temp = 1
        } else if ball.center.y <= ballRadius {
            temp = 2
        } else if ball.center.x <= ballRadius {
            temp = 3
        } else if ball.center.y >= view.bounds.size.height - ballRadius {
            temp = 4
        }
        stopTimerCheck()
        timerRollBall = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall), userInfo: nil, repeats: true)
    }
    
    func rollBall() {
        
        var centerWidth = ballRadius*angle
        var centerHeight = ballRadius*angle
        var testAngle = angle
        let centerX = ball.center.x
        let centerY = ball.center.y
        let oldCenterX = oldCenterBall.x
        let oldCenterY = oldCenterBall.y
        
        if temp == 1 {
            testAngle = -angle
            if centerY > oldCenterY {
                centerWidth = -centerWidth
            } else {
                centerWidth = -centerWidth
                centerHeight = -centerHeight
            }
        } else if temp == 2 {
            if centerX < oldCenterX {
                testAngle = -angle
                centerWidth = -centerWidth
            }
        } else if temp == 3 {
            if centerY <= oldCenterY {
                centerHeight = -centerHeight
            }
        } else if temp == 4 {
            if centerX > oldCenterX {
                centerHeight = -centerHeight
            } else {
                testAngle = -angle
                centerWidth = -centerWidth
                centerHeight = -centerHeight
            }
        }
        
        oldCenterBall = ball.center
        
        ball.transform = ball.transform.rotated(by: testAngle)
        ball.center = CGPoint(x: ball.center.x + centerWidth, y: ball.center.y + centerHeight)

        if ball.center.y >= view.bounds.size.height - ballRadius || ball.center.y <= ballRadius || ball.center.x  <= ballRadius || ball.center.x >= view.bounds.size.width - ballRadius {
            timerRollBall.invalidate()
            startTimerCheck()
        }
    }
    
    
}
