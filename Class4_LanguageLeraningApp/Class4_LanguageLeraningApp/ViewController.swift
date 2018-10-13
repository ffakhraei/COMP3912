//
//  ViewController.swift
//  Class4_LanguageLeraningApp
//
//  Created by user145368 on 10/3/18.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var wordListPV: UIPickerView!
    
    var pickerData: [String] = []
    
    //1 horizontal segment
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //setting number of rows equal to array size
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    //populating pickerview data
    func pickerView(_ pickerview: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    //storing user selection from pickerview
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(pickerData[row])
        UserDefaults.standard.set(pickerData[row], forKey: "word")
    }
    
    @IBAction func btnShowWord(_ sender: UIButton) {
        //trigger the segue
        print("Show word")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        pickerData = ["Dog", "Cat", "Horse", "Chicken"]
        
        wordListPV.reloadAllComponents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        wordListPV.delegate = self
        wordListPV.dataSource = self
    }
}

