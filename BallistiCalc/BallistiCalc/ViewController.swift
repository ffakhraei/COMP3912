//
//  ViewController.swift
//  BallistiCalc
//
//  Created by Farzin Fakhraei on 2018-10-23.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var txtCalibre: UITextField!
    @IBOutlet weak var txtMuzzleVelocity: UITextField!
    @IBOutlet weak var txtImpactDistance: UITextField!
    @IBOutlet weak var txtZeroDistance: UITextField!
    @IBOutlet weak var txtSightHeight: UITextField!
    @IBOutlet weak var txtWindDirection: UITextField!
    @IBOutlet weak var txtWindSpeed: UITextField!
    @IBOutlet weak var txtBallisticCoefficient: UITextField!
    @IBOutlet weak var btnCalculate: UIButton!
    @IBOutlet weak var pvCalibre: UIPickerView!
    @IBOutlet weak var pvGrain: UIPickerView!
    
    let pvCalibreData = [".30-06", ".308", ".223", ".22LR", "9mm"]
    let pvGrainData = [".30-06 150", ".30-06 165", ".30-06 200", ".30-06 220", ".308 125", ".308 150", ".308 168", ".308 175", ".308 185", ".223 36 55 60 69 77", ".22LR 40 38 32 31 30"  ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //connect data:
        self.pvCalibre.delegate = self
        self.pvCalibre.dataSource = self
        self.pvGrain.delegate = self
        self.pvGrain.dataSource = self
        
        txtMuzzleVelocity.delegate = self
        txtZeroDistance.delegate = self
        txtWindSpeed.delegate = self
        
        
        //txtCalibre.inputView = pvCalibre
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool // called when 'return' key pressed. return NO to ignore.
    {
        txtZeroDistance.resignFirstResponder()
        txtImpactDistance.resignFirstResponder()
        txtSightHeight.resignFirstResponder()
        txtMuzzleVelocity.resignFirstResponder()
        txtWindDirection.resignFirstResponder()
        txtWindSpeed.resignFirstResponder()
        txtBallisticCoefficient.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pvCalibre {
            return pvCalibreData.count
        } else {
            return pvGrainData.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pvCalibre {
            return pvCalibreData[row]
        } else {
            return pvGrainData[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pvCalibre {
            UserDefaults.standard.set(pvCalibreData[row], forKey: "calibre")
        } else {
            UserDefaults.standard.set(pvGrainData[row], forKey: "grain")
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        pickerView.subviews[1].isHidden = true
        pickerView.subviews[2].isHidden = true
        if pickerView == pvCalibre {
            let pickerLabel = UILabel()
            let titleData = pvCalibreData[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name:"Helvetica", size: 15.0)!])
            pickerLabel.attributedText = myTitle
            pickerLabel.textAlignment = .left
            return pickerLabel
        } else{
            let pickerLabel = UILabel()
            let titleData = pvGrainData[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedString.Key.font:UIFont(name:"Helvetica", size: 15.0)!])
            pickerLabel.attributedText = myTitle
            pickerLabel.textAlignment = .left
            return pickerLabel        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }


}
