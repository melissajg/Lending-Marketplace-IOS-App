//
//  TrackerViewController.swift
//  LendShark
//
//  Created by Melissa Gaines on 11/18/23.
//

import UIKit
import Firebase
import FirebaseAuth

class TrackerViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource, UISheetPresentationControllerDelegate{
    
    let ref = Database.database().reference(withPath: "people")
    var items :[Person] = []
    var personId = ""
    lazy var nav = UIStoryboard(name:"Main", bundle: nil).instantiateViewController(withIdentifier: "AddViewController")
    
    @IBAction func newTradeButton(_ sender: Any) {
        nav.modalPresentationStyle = .pageSheet
        if let sheet = nav.sheetPresentationController {

            // 3
            sheet.detents = [.medium()]

        }
        // 4
        self.present(nav, animated: true, completion: nil)
    }
    @IBOutlet weak var table: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemCell
        let personObject = items[indexPath.row]
        
        cell.userImageView.layer.cornerRadius = 20.0
        cell.nameLabel?.text = personObject.name + " " + personObject.lname
      //  cell.itemEmojisLabel?.text = personObject.name + " " + personObject.lname
        cell.tradeTypeLabel?.text = "you owe"
        cell.moneyLabel?.text = "$"+personObject.age
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let personItems = items[indexPath.row]
            personItems.ref?.removeValue()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "TraderItemsListViewController") as? TraderItemsListViewController{
            self.navigationController?.pushViewController(vc, animated: true)
        }
        /*personId = items[indexPath.row].key
        performSegue(withIdentifier: "toEdit", sender: nil)*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       /* if segue.identifier == "toEdit"{
            let editViewController = segue.destination as! EditViewController
            editViewController.personId = personId
        }
        */
        
        if let editViewController = segue.destination as? UINavigationController,
            // ii.
           let editViewController = editViewController.topViewController as? EditViewController {

            editViewController.personId = personId
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
         
   
        
        ref.observe(.value, with: { snapshot in
            print(snapshot.value as Any )
        })
        ref.observe(.value, with: { snapshot in
            var newPerson: [Person] = []
            for child in snapshot.children{
                if let snapshot = child as? DataSnapshot,
                    let persons = Person(snapshot: snapshot){
                    newPerson.append(persons)
                }
            }
            self.items = newPerson
            self.table.reloadData()
             })
        
        
    }
    
    
    
    
    


}

