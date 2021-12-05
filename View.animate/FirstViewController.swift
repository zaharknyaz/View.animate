//
//  FirstViewController.swift
//  View.animate
//
//  Created by Захар Князев on 05.12.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.5, delay: 0.3, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: .allowAnimatedContent, animations: {
            self.imageView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (bool) in
            let tbc = self.storyboard!.instantiateViewController(withIdentifier: "mainSID")
            tbc.modalPresentationStyle = .fullScreen
            self.present(tbc, animated: false, completion: nil)
        }
    }
    
}
