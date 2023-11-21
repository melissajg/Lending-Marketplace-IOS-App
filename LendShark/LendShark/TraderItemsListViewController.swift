//
//  TraderItemsListViewController.swift
//  LendShark
//
//  Created by Melissa Gaines on 11/21/23.
//

import UIKit

class TraderItemsListViewController: UIViewController{
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lendingCountLabel: UILabel!
    @IBOutlet weak var borrowingCountLabel: UILabel!
    @IBOutlet weak var filterSegmentControl: UISegmentedControl!
    
    @IBOutlet weak var table: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    /*
     ,UITableViewDelegate,UITableViewDataSource{
         func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         
         }
         
         func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
             <#code#>
         }
     */
}

