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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func didPanTray(panGestureRecognizer: UIPanGestureRecognizer) {
        
        let point = panGestureRecognizer.locationInView(view)
        let translation = panGestureRecognizer.translationInView(view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
                    print("Gesture began at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
                    print("Gesture changed at: \(point)")
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
                    print("Gesture ended at: \(point)")
                }

        
    }
    
    
//    
//    @IBAction func didPanTray(panGestureRecognizer: UIPanGestureRecognizer) {
//        
//        print("in didPanTray")
//        
//        let point = panGestureRecognizer.locationInView(view)
//        let velocity = panGestureRecognizer.velocityInView(view)
//        let translation = panGestureRecognizer.translationInView(view)
//        
//        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
//            print("Gesture began at: \(point)")
//        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
//            print("Gesture changed at: \(point)")
//        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
//            print("Gesture ended at: \(point)")
//        }
    
        
        
//    }

    
    
    
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
