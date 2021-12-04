//
//  ViewController.swift
//  View.animate
//
//  Created by Захар Князев on 27.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func pushButtonAction(_ sender: Any) {
        UIView.animate(withDuration: 2) {
            //self.button.alpha = 0
            //self.button.center = self.view.center
            var frame = self.button.frame
            frame.origin.x = 0
            frame.origin.y = 0
            //frame.size = CGSize(width: 50, height: 50)
            self.button.frame = frame
        }
        
    }
       
    @IBAction func pushButtonAction2(_ sender: Any) {
        let originalFrame = button2.frame
        let button2center = button2.center
        
        UIView.animate(withDuration: 0.2, animations: {
            //self.button2.alpha = 0
            var newframe = self.button2.frame
            newframe.size.width = newframe.size.width - 20
            newframe.size.height = newframe.size.height - 20
            self.button2.frame = newframe
            self.button2.center = button2center
        }) { (bool) in
            //self.button2.alpha = 1
            self.button2.frame = originalFrame
            self.button2.center = button2center
        }
    }
        
}

