//
//  mainViewController.swift
//  cp_canvas
//
//  Created by Xu, Cheng on 11/12/15.
//  Copyright © 2015 sansserif. All rights reserved.
//

import UIKit


class mainViewController: UIViewController {
    
    @IBOutlet weak var trayView: UIView!
    var trayOriginalCenter: CGPoint!
    
    var trayDownOffset: CGFloat!
    var trayUp: CGPoint!
    var trayDown: CGPoint!
    
    var newlyCreatedFace : UIImageView!
    var newlyCreatedFaceOriginalCenter: CGPoint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(  trayView.center )
        // Do any additional setup after loading the view.
        
        trayDownOffset = 160
        trayUp = trayView.center
        trayDown = CGPoint(x: trayView.center.x, y: trayView.center.y+trayDownOffset)
        
        
        
        
        
    }
    
    
    @IBAction func didPanTray(panGestureRecognizer: UIPanGestureRecognizer) {
        
        let point = panGestureRecognizer.locationInView(view)
        let translation = panGestureRecognizer.translationInView(view)
        
        
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            //            print("Gesture began at: \(point)")
            trayOriginalCenter = trayView.center
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            //            print("Gesture changed at: \(point)")
            
            trayView.center = CGPoint(x: trayOriginalCenter.x, y: trayOriginalCenter.y+translation.y)
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            //            print("Gesture ended at: \(point)")
            
            let velocity = panGestureRecognizer.velocityInView(view)
            // print (velocity.y)
            //going down
            if (velocity.y>0){
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.trayView.center = self.trayDown
                    }, completion: { (Bool) -> Void in
                })
                
            }
                //going up
            else if (velocity.y<0){
                UIView.animateWithDuration(0.4, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options:[] , animations: { () -> Void in
                    self.trayView.center = self.trayUp
                    }, completion: { (Bool) -> Void in
                })
            }
            
        }
        
        
    }
    
    
    @IBAction func didPanFace(panGestureRecognizer: UIPanGestureRecognizer) {
        //        print("didpanface")
        let point = panGestureRecognizer.locationInView(view)
        
        
        let translation = panGestureRecognizer.translationInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            print("Gesture began at: \(point)")
            
            let imageView = panGestureRecognizer.view as! UIImageView
            
            newlyCreatedFace = UIImageView(image: imageView.image)
            newlyCreatedFace.center = imageView.center
            view.addSubview(newlyCreatedFace)
            
            //            print(newlyCreatedFace.center)
            newlyCreatedFace.center.y += trayView.frame.origin.y
            
            newlyCreatedFaceOriginalCenter = newlyCreatedFace.center
            
            print(newlyCreatedFaceOriginalCenter)
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            print("Gesture changed at: \(point)")
            newlyCreatedFace.center = CGPoint(x: newlyCreatedFaceOriginalCenter.x + translation.x, y: newlyCreatedFaceOriginalCenter.y + translation.y)
            
            
            
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            
            print("Gesture ended at: \(point)")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
