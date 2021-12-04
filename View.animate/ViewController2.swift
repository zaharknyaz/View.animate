//
//  ViewController2.swift
//  View.animate
//
//  Created by Захар Князев on 04.12.2021.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var buttonScale: UIButton!
    @IBOutlet weak var buttonRotation: UIButton!
    @IBOutlet weak var buttonTranslation: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func buttonScaleAction(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            self.buttonScale.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (bool) in
            self.buttonScale.transform = .identity
        }
    }
    
    @IBAction func buttonRotationAction(_ sender: Any) {
        
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .allowAnimatedContent, animations: {
            self.buttonRotation.transform = CGAffineTransform(rotationAngle: CGFloat.pi/50)
        }) { (bool) in
            self.buttonRotation.transform = .identity
        }
        
    }
    
    @IBAction func buttonTranslationAction(_ sender: Any) {
        UIView.animate(withDuration: 2, animations: {
            let t = CGAffineTransform(translationX: 100, y: 100).scaledBy(x: 2, y: 0.5)
            self.buttonTranslation.transform = t
        }) { (bool) in
            self.buttonTranslation.transform = .identity
        }
    }
    
}
