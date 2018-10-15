//
//  UpdateViewController.swift
//  contactList
//
//  Created by user145368 on 10/9/18.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class UpdateViewController: UIViewController {
    
    var updateComapny: Company?

    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtWebsite: UITextField!
    @IBAction func btnSave(_ sender: UIButton) {
        updateComapny?.name = txtName.text
        updateComapny?.phone = txtName.text
        updateComapny?.website = txtWebsite.text
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
        
        print("contact updated")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtName.text = updateComapny?.name
        txtPhone.text = updateComapny?.phone
        txtWebsite.text = updateComapny?.website
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
