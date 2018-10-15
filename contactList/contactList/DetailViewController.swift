//
//  DetailViewController.swift
//  contactList
//
//  Created by user145368 on 10/9/18.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var showCompany: Company?

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    @IBOutlet weak var lblWebsite: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblName.text = showCompany?.name
        lblPhone.text = showCompany?.phone
        lblWebsite.text = showCompany?.website
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sguEdit" {
            let vc = segue.destination as! UpdateViewController
            vc.updateComapny = showCompany
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        lblName.text = showCompany?.name
        lblPhone.text = showCompany?.phone
        lblWebsite.text = showCompany?.website
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
