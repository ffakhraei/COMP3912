//
//  DetailViewController.swift
//  Class4_LanguageLeraningApp
//
//  Created by user145368 on 10/8/18.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var imgPlaceholder: UIImageView!
    @IBOutlet weak var lblPlaceHolder: UILabel!
    
    @IBAction func imgTapped(_ sender: UITapGestureRecognizer) {
        print("Tapped image")
        if lblPlaceHolder.isHidden {
            lblPlaceHolder.isHidden = false
        } else {
            lblPlaceHolder.isHidden = false
        }
    }
    
    
    //setting up data
    var dog = [
        "name":"Dog",
        "image":"dog"]

    var cat = [
        "name":"Cat",
        "image":"cat"]
    
    var chicken = [
        "name":"Chicken",
        "image":"chicken"]
    
    var horse = [
        "name":"Horse",
        "image":"horse"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var words : [[String : String]] = [dog, cat, horse, chicken]
        
        let word = UserDefaults.standard.object(forKey: "word")
        print(word!)
        
        for i in (0...words.count - 1) {
            if (words[i]["name"]! == word as! String) {
                print("Found!")
                //update the image
                imgPlaceholder.image = UIImage(imageLiteralResourceName: words[i]["image"]!)
                lblPlaceHolder.text = words[i]["name"]
            }
        }
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
