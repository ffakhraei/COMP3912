//
//  ReticleView.swift
//  BallistiCalc
//
//  Created by Farzin Fakhraei on 2018-10-24.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class ReticleView: UIViewController {

    @IBOutlet weak var imgReticle: UIImageView!
    @IBOutlet weak var txtImpactDistance: UITextField!
    @IBOutlet weak var lblWindage: UILabel!
    @IBOutlet weak var lblElevation: UILabel!
    @IBOutlet weak var btnReCalculate: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //imgReticle.image = UIImage(named:"MilDot")
        
        let backgroundImage = UIImage(named: "MilDot")
        let foregroundImage = UIImage(named: "Impact")
        
        let imageSize = CGSize(width: 600, height: 600)
        UIGraphicsBeginImageContext(imageSize)
        
        let areaSize = CGRect(x: 0, y: 0, width: imageSize.width, height: imageSize.height)
        
        let impactAreaSize = CGRect(x:292, y: 292, width: 15, height: 15)
        
        backgroundImage!.draw(in: areaSize)
        foregroundImage!.draw(in: impactAreaSize, blendMode: .normal, alpha: 0.8)
        
        imgReticle.image = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        //imgReticle.image = UIImage(newImage)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
