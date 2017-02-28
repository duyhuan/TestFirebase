//
//  ViewController.swift
//  TestFirebase
//
//  Created by techmaster on 2/27/17.
//  Copyright © 2017 techmaster. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var textFieldUsername: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    var ref: FIRDatabaseReference?
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldUsername.layer.borderWidth = 1.0
        textFieldUsername.layer.cornerRadius = 5.0
        textFieldUsername.layer.borderColor = UIColor.gray.cgColor
        
        textFieldPassword.layer.borderWidth = 1.0
        textFieldPassword.layer.cornerRadius = 5.0
        textFieldPassword.layer.borderColor = UIColor.gray.cgColor
        
        ref = FIRDatabase.database().reference()
        
    }

    @IBAction func buttonRegisterAction(_ sender: UIButton) {
        
        let username = textFieldUsername.text
        
        let password = textFieldPassword.text
        
        if username != "" && password != "" {
            index = index + 1
            let user = ["Username": username, "Password": password]
            let usersRef = ref?.child("User")
            //usersRef?.setValue(user)
            //ref?.child("User").childByAutoId().setValue("Hello Firebase")
            
            usersRef?.child("User\(index)").setValue(user)
            //usersRef?.child("User2").setValue(user2)
        } else {
            let alert = UIAlertController(title: "Error", message: "Username or Password nil", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }

}

