//
//  CompanyTableViewController.swift
//  contactList
//
//  Created by user145368 on 10/9/18.
//  Copyright © 2018 Farzin Fakhraei. All rights reserved.
//

import UIKit
import CoreData

class CompanyTableViewController: UITableViewController, UISearchBarDelegate {
    
    //Get a ref to Core Data
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Create an empty array to hold tasks
    var companies: [Company] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return companies.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getData()
        tableView.reloadData()
    }
    
    func getData() {
        do {
            companies = try context.fetch(Company.fetchRequest())
        }
        catch {
            print("Failed to fetch data")
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "theCell", for: indexPath)
        let company = companies[indexPath.row]
        
        if let temp = company.name {
            cell.textLabel?.text = temp
        }

        return cell
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Preparing for segue")
        if segue.identifier == "sguDetail" {
            let vc = segue.destination as! DetailViewController
            vc.showCompany = companies[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
        
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("search string changed")
        searchBar.setShowsCancelButton(true, animated: true)
        if !searchText.isEmpty {
            let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name CONTAINS[c] %@", searchText)
            do {
                companies = try context.fetch(fetchRequest)
                print("companies found: \(companies.count)")
                tableView.reloadData()
            } catch {
                print("failed to fetch data")
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = nil
        searchBar.showsCancelButton = false
        searchBar.resignFirstResponder()
        getData()
        tableView.reloadData()
 }
 
 
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let company = companies[indexPath.row]
            context.delete(company)
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                companies = try context.fetch(Company.fetchRequest())
            } catch {
                print ("failed to fetch data")
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
