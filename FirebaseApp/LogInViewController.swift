//
//  ViewController.swift
//  FirebaseApp
//
//  Created by Елисей Мищенко on 11.02.2022.
//

import UIKit
import Firebase

class LogInViewController: UIViewController {

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
    
    @IBAction func logInButton(_ sender: UIButton) {
        guard let email = emailTextField.text, let password = passwordTextField.text, email !=  "", password != "" else {
            showAlert()
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            if error != nil {
                self?.showAlert()
                return
            }
            if user != nil {
                self?.performSegue(withIdentifier: "login", sender: nil)
                return
            }
            self?.showAlert()
        }
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue) {
        emailTextField.text = ""
        passwordTextField.text = ""
    }

    
    
    
}

