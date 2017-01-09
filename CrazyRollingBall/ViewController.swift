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
    var centerBall: CGPoint! = nil
    var timer0: Timer = Timer()
    var timer1: Timer = Timer()
    var timer2: Timer = Timer()
    var timer3: Timer = Timer()
    var timer4: Timer = Timer()
    var timer5: Timer = Timer()
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        centerBall = ball.center
        centerBall = ball.center
        timer1 = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(ViewController.rollBall), userInfo: nil, repeats: true)
    }
    
    func addBall() {
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.frame.size = CGSize(width: ballRadius*2, height: ballRadius*2)
        ball.center = view.center
        view.addSubview(ball)
    }
    
    func rollBall() {
        ball.transform = ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y + ballRadius*angle)
        timer1.invalidate()
        timer0 = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(ViewController.rollBall1), userInfo: nil, repeats: true)
    }
    
    func rollBall1() {
        if ball.center.x >= view.bounds.size.width - ballRadius {
            timer1.invalidate()
            timer2 = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(ViewController.rollBall2), userInfo: nil, repeats: true)
        } else if ball.center.y <=  ballRadius {
            
        } else if ball.center.x <= ballRadius {
            
        } else if ball.center.y >= view.bounds.size.height - ballRadius {
            
        }
    }
    
    func rollBall2() {
        ball.transform = ball.transform.rotated(by: angle)
        if ball.center.y > centerBall.y {
            centerBall = ball.center
            ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y + ballRadius*angle)
        } else {
            centerBall = ball.center
            ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y - ballRadius*angle)
        }
        
        
        if ball.center.y <=  ballRadius {
            timer2.invalidate()
            timer3 = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(ViewController.rollBall3)
                , userInfo: nil, repeats: true)
        }
    }
    
    func rollBall3() {
        ball.transform = ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y + ballRadius*angle)
        if ball.center.x <= ballRadius {
            timer3.invalidate()
            timer4 = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(ViewController.rollBall4), userInfo: nil, repeats: true)
        }
    }
    
    func rollBall4() {
        ball.transform = ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x + ballRadius*angle, y: ball.center.y + ballRadius*angle)
        if ball.center.x >= view.frame.size.width - ballRadius {
            timer4.invalidate()
            timer5 = Timer.scheduledTimer(timeInterval: 0.002, target: self, selector: #selector(ViewController.rollBall5), userInfo: nil, repeats: true)
        }
    }
    
    func rollBall5() {
        ball.transform = ball.transform.rotated(by: angle)
        ball.center = CGPoint(x: ball.center.x - ballRadius*angle, y: ball.center.y + ballRadius*angle)
    }
    
}
