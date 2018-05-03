//
//  CardsViewController.swift
//  Tinder
//
//  Created by user132893 on 5/3/18.
//  Copyright © 2018 user132893. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

   
    @IBOutlet weak var cardView: UIImageView!
    var cardInitialCenter: CGPoint!
    var cardOffset: CGFloat!
    var cardLeft: CGPoint!
    var cardRight: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.cardOffset = 400
        self.cardLeft = CGPoint(x: self.cardView.center.x-self.cardOffset, y: self.cardView.center.y)
        self.cardRight = CGPoint(x: self.cardView.center.x+self.cardOffset, y: self.cardView.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func dragCard(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == .began{
            self.cardInitialCenter = self.cardView.center
        }
        else if sender.state == .changed{
            
        }
        else if sender.state == .ended{
            if velocity.x > 0{
                UIView.animate(withDuration: 0.3) {
                    self.cardView.center = self.cardRight
                }
            }
            else
            {
                UIView.animate(withDuration: 0.3) {
                    self.cardView.center = self.cardLeft
                }
            }
        }
    }
    

}
