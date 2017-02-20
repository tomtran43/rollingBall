//
//  ViewController.swift
//  RollingBall
//
//  Created by Loc Tran on 2/17/17.
//  Copyright © 2017 LocTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var ball = UIImageView()
    var radian = CGFloat()
    var ballRadius: CGFloat = 32.0
    var deltaAngle: CGFloat = 0.1
    var rollRight = Bool()
    var timer = Timer()
    var X: CGFloat = 3
    var Y: CGFloat = 3
    
    @IBAction func actionSimpleRoll(_ sender: UIButton) {
        removeSubView()
        addBall()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rollBall), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func actionRandomRoll(_ sender: UIButton) {
        removeSubView()
        addBall()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rollBallRandom), userInfo: nil, repeats: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
    
    }
    
    func removeSubView(){
        let subViews = self.view.subviews
        for subView in subViews{
            if subView.tag >= 101{
                subView.removeFromSuperview()
            }
        }
        timer.invalidate()
    }
    
    
    func addBall(){
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ball.center = CGPoint(x: ballRadius, y: mainViewSize.height/2)
        ball.tag = 101
        self.view.addSubview(ball)
        
    }
    
    func rollBall(){
        let mainViewSize = self.view.bounds.size
        radian += deltaAngle
        
        if (ball.center.x + ballRadius > mainViewSize.width){
            rollRight = false
        }
        
        if (ball.center.x - ballRadius < 0){
            rollRight = true
        }
        
        if rollRight == true{
            ball.transform = CGAffineTransform(rotationAngle: radian)
            ball.center = CGPoint(x: ball.center.x + ballRadius * deltaAngle, y: ball.center.y)
        }else{
            ball.transform = CGAffineTransform(rotationAngle: -radian)
            ball.center = CGPoint(x: ball.center.x - ballRadius * deltaAngle, y: ball.center.y)
        }
        
    }
    
    func rollBallRandom(){
        
        radian += deltaAngle
        
        
        if (ball.center.y + 32 > self.view.bounds.size.height){
            Y = CGFloat(Int(arc4random_uniform(6))) * -1
            X = CGFloat(Int(arc4random_uniform(12))) - 5
        }
        
        if (ball.center.y - 32 < 0){
            Y = CGFloat(Int(arc4random_uniform(6)))
            X = CGFloat(Int(arc4random_uniform(12))) - 5

        }
        
        if (ball.center.x + 32 > self.view.bounds.size.width){
            X = CGFloat(Int(arc4random_uniform(6))) * -1
            Y = CGFloat(Int(arc4random_uniform(12))) - 5

        }
        
        if (ball.center.x - 32 < 0){
            X = CGFloat(Int(arc4random_uniform(6)))
            Y = CGFloat(Int(arc4random_uniform(12))) - 5

        }
        
        ball.transform = CGAffineTransform(rotationAngle: radian)
        ball.center = CGPoint(x: ball.center.x + X, y: ball.center.y + Y)

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

