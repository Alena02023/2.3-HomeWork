//
//  ViewController.swift
//  2.3 HomeWork
//
//  Created by Елена Лазука on 03.02.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
  
    private var user = User.getUserData()
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC  = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC =  tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController

        welcomeVC.user = user
        aboutUserVC.user = user
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        user = User.getUserData()
    }
    @IBAction func logInButton() {
        if userNameTextField.text != user.name ||
            passwordTextField.text != user.password {
            showAlert(title: "Invalid login or password",
                      message: "Please, enter correct login and password",
                      textField: passwordTextField)
            return // выход из блока кода, но если некуда идти дальше, то не зачем писать return
        }
        
        performSegue(withIdentifier: "logIn", sender: nil) // программный переход с идентификатором
    }


    @IBAction func forgotNameButton() {
        showAlert(title: "Oops!", message: "Your name is \(user.name) 😉")
    }
    @IBAction func forgotPasswordButton() {
        showAlert(title: "Oops!", message: "Your password is \(user.password) 😉")
    }
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userNameTextField.text = nil
        passwordTextField.text = nil
    }
    }

extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
  
    }
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            logInButton()
        }
        return true
    }
}




