//
//  ViewController.swift
//  Movie
//
//  Created by Pham Huu Nhu on 6/3/17.
//  Copyright © 2017 Pham Huu Nhu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccountTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentLoggedInScreen()
            })
        }
    }
    
    
    @IBAction func loginTapped(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if let firebaseError = error {
                    print(firebaseError.localizedDescription)
                    return
                }
                self.presentLoggedInScreen()
            })
        }
    }
    
    func presentLoggedInScreen(){
        let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loggedInVC:LogoutViewController = storyboard.instantiateViewController(withIdentifier: "LoggedInVC") as! LogoutViewController
        self.present(loggedInVC, animated: true, completion: nil)
    }
}

