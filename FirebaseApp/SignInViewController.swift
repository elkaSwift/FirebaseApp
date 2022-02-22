//
//  SignInViewController.swift
//  FirebaseApp
//
//  Created by Елисей Мищенко on 11.02.2022.
//

import UIKit
import Firebase

class SignInViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Error", message: "Fill in all the fields", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func signInButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email != "", password != "" else {
            showAlert()
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
            if error == nil {
                if user != nil {
                    self?.performSegue(withIdentifier: "signin", sender: nil)
                }
            }
        }
    }
    
}
