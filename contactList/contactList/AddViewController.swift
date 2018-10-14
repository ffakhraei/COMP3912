//
//  AddViewController.swift
//  contactList
//
//  Created by user145368 on 10/9/18.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var txtPhone: UITextField!
    
    @IBOutlet weak var txtWebsite: UITextField!
    
    @IBAction func btnAdd(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let company = Company(context: context)
        company.name = txtName.text
        company.phone = txtPhone.text
        company.website = txtWebsite.text
        
        //Save data to core data
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        let _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
