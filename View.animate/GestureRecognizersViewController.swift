//
//  GestureRecognizersViewController.swift
//  View.animate
//
//  Created by Захар Князев on 07.12.2021.
//

import UIKit

class GestureRecognizersViewController: UIViewController {
    @IBOutlet weak var viewForTap: UIView!
    @IBOutlet weak var viewForSwipe: UIView!
    @IBOutlet weak var labelPan: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        //tap.numberOfTapsRequired = 2
        //tap.numberOfTouchesRequired = 2
        viewForTap.isUserInteractionEnabled = true
        viewForTap.gestureRecognizers = [tap]
        
        //swipeLeft
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeLeft))
        swipeLeft.direction = .left
        
        //swipeRight
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeRight))
        swipeRight.direction = .right
        
        //swipeDown
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeDown))
        swipeDown.direction = .down
        
        //swipeUp
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.swipeUp))
        swipeUp.direction = .up
        
        viewForSwipe.gestureRecognizers = [swipeLeft, swipeRight, swipeDown, swipeUp]
        
        let pan = UIPanGestureRecognizer(target: self, action: #selector(self.pan))
        labelPan.gestureRecognizers = [pan]
        
    }
    
    var center: CGPoint = CGPoint(x: 0, y: 0)
    
    @objc func pan(panGestureRecognizer: UIPanGestureRecognizer) {
        if panGestureRecognizer.state == .began {
            center = labelPan.center
        }
        
        let x = panGestureRecognizer.translation(in: self.view).x
        let y = panGestureRecognizer.translation(in: self.view).y
        
        //перемещаем только по оси X
        let newCenter = CGPoint(x: center.x + x, y: center.y)
        
        //перемещаем только по оси Y
        //let newCenter = CGPoint(x: center.x, y: center.y + y)
        
        //перемещаем по оси X и по оси Y
        //let newCenter = CGPoint(x: center.x + x, y: center.y + y)
        
        labelPan.text = "x=\(Int(x)), y=\(Int(y))"
        //labelPan.center = panGestureRecognizer.translation(in: self.view)
        labelPan.center = newCenter
        
        if panGestureRecognizer.state == .ended {
            var text = "Touch me"
            
            //в зависимости от смещения по X устанавливаем текст
            if x < -80 {
                text = "Это было больно"
            }
            
            //реализовать установку usingSpringWithDamping в зависимости от смещения по X
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: .allowAnimatedContent, animations: {
                self.labelPan.center = self.center
            }) { (bool) in
                self.labelPan.text = text
            }
        }
    }
    
    
    
    //Оптимизировать - переписать на одну функцию с передачей параметров
    
    func animateSwipe(dx: CGFloat, dy: CGFloat) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            self.viewForSwipe.transform = CGAffineTransform(translationX: dx, y: dy)
        }) { (bool) in
            UIView.animate(withDuration: 1.5) {
                self.viewForSwipe.transform = .identity
            }
        }
    }
    
    @objc func swipeLeft() {
        animateSwipe(dx: -200, dy: 0)
    }
    
    @objc func swipeRight() {
        animateSwipe(dx: 200, dy: 0)
    }
    
    @objc func swipeDown() {
        animateSwipe(dx: 0, dy: 200)
    }
    
    @objc func swipeUp() {
        animateSwipe(dx: 0, dy: -200)
    }
    
    @objc func tap() {
        //print("tap")
        UIView.animate(withDuration: 1.5, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            self.viewForTap.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (bool) in
            self.viewForTap.transform = .identity
        }
    }
}
