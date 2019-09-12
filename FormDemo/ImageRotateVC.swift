//
//  ImageRotateVC.swift
//  FormDemo
//
//  Created by Disha on 5/15/18.
//  Copyright © 2018 Disha. All rights reserved.
//

import UIKit

class ImageRotateVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        rotateView(targetView: imgView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    private func rotateView(targetView: UIView, duration: Double = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
        }) { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }
}
