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
    let angle: CGFloat =  1 * CGFloat(M_PI/180)
    var oldCenterBall: CGPoint! = nil
    var newCenterBall: CGPoint! = nil
    var timer: Timer = Timer()
    var timer1: Timer = Timer()
    var timer2: Timer = Timer()
    var timer3: Timer = Timer()
    var timer4: Timer = Timer()
    var timer5: Timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        oldCenterBall = ball.center
        timer = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall() {
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.frame.size = CGSize(width: ballRadius*2, height: ballRadius*2)
        ball.center = view.center
        view.addSubview(ball)
    }
    
    func startTimer1() {
        timer1 = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall1), userInfo: nil, repeats: true)
    }
    
    func stopTimer1() {
        timer1.invalidate()
    }
    
    func rollBall() {
        ball.transform = ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y + ballRadius*angle)
        if ball.center.x >= view.bounds.size.width - ballRadius {
            timer.invalidate()
            startTimer1()
        }
    }
    
    func rollBall1() {
        if ball.center.x >= view.bounds.size.width - ballRadius {
            stopTimer1()
            timer2 = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall2), userInfo: nil, repeats: true)
        } else if ball.center.y <= ballRadius {
            stopTimer1()
            timer3 = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall3), userInfo: nil, repeats: true)
        } else if ball.center.x <= ballRadius {
            stopTimer1()
            timer4 = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall4), userInfo: nil, repeats: true)
        } else if ball.center.y >= view.bounds.size.height - ballRadius {
            stopTimer1()
            timer5 = Timer.scheduledTimer(timeInterval: 0.000001, target: self, selector: #selector(ViewController.rollBall5), userInfo: nil, repeats: true)
        }
    }
    
    func rollBall2() {
        ball.transform = ball.transform.rotated(by: -angle)
        if ball.center.y > oldCenterBall.y {
            oldCenterBall = ball.center
            ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y + ballRadius*angle)
        } else {
            oldCenterBall = ball.center
            ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y - ballRadius*angle)
        }
        if ball.center.y >= view.bounds.size.height - ballRadius || ball.center.y <= ballRadius || ball.center.x  <= ballRadius {
            timer2.invalidate()
            startTimer1()
        }
    }
    
    func rollBall3() {
        if ball.center.x > oldCenterBall.x {
            oldCenterBall = ball.center
            ball.transform = ball.transform.rotated(by: angle)
            ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y + ballRadius*angle)
        } else {
            oldCenterBall = ball.center
            ball.transform = ball.transform.rotated(by: -angle)
            ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y + ballRadius*angle)
        }
        
        if ball.center.x <= ballRadius || ball.center.x >= view.bounds.size.width - ballRadius || ball.center.y >= view.bounds.size.height - ballRadius {
            timer3.invalidate()
            startTimer1()
        }
    }
    
    func rollBall4() {
        ball.transform = ball.transform.rotated(by: angle)
        if ball.center.y > oldCenterBall.y {
            oldCenterBall = ball.center
            ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y + ballRadius*angle)
        } else {
            oldCenterBall = ball.center
            ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y - ballRadius*angle)
        }
        
        if ball.center.x >= view.frame.size.width - ballRadius || ball.center.y >= view.frame.size.height - ballRadius || ball.center.y <= ballRadius {
            timer4.invalidate()
            startTimer1()
        }
    }
    
    func rollBall5() {
        if ball.center.x > oldCenterBall.x {
            oldCenterBall = ball.center
            ball.transform = ball.transform.rotated(by: angle)
            ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y - ballRadius*angle)
        } else {
            oldCenterBall = ball.center
            ball.transform = ball.transform.rotated(by: -angle)
            ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y - ballRadius*angle)
        }
        
        if ball.center.x <= ballRadius || ball.center.x >= view.bounds.size.width - ballRadius || ball.center.y <= ballRadius {
            timer5.invalidate()
            startTimer1()
        }
    }
    
}
