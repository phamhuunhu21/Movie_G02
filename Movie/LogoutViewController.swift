//
//  LogoutViewController.swift
//  Movie
//
//  Created by Pham Huu Nhu on 6/3/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogoutViewController: UIViewController {

    @IBAction func logoutTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            dismiss(animated: true, completion: nil)
        }
        catch {
            print("There was a problem logging out")
        }
        
    }
    

}
