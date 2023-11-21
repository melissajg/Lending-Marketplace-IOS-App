//
//  ProfileViewController.swift
//  LendShark
//
//  Created by Melissa Gaines on 11/18/23.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func logOut(_ sender: Any) {
 
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
      //   self.performSegue(withIdentifier: "toLoginPage", sender: nil)
     
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
     
        
    }
    
}
