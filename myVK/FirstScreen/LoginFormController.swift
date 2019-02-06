//
//  ViewController.swift
//  1l_interface_Kanatev_Aleksey
//
//  Created by AlexMacPro on 18/12/2018.
//  Copyright © 2018 AlexMacPro. All rights reserved.
//

import UIKit


final class LoginFormController: UIViewController, UITextFieldDelegate {
    
    func showInputError() {
        self.showErrorMessage(title: "Ошибка", message: "Логин или пароль введены с ошибкой. Попробуйте снова.")
        { self.clearAllTextFields(allTextFields: [self.loginTextField, self.passwordTextField]) }
    }
    
    func checkInput() -> Bool {
        if loginTextField.text! == UserData.rightLogin && passwordTextField.text! == UserData.rightPassword {
            return true
        } else {
            showInputError()
            return false
        }
    }
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var enterButtonOutlet: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginTextField.delegate = self
        loginTextField.tag = 0
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        
        
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.clearAllTextFields(allTextFields: [self.loginTextField, self.passwordTextField])
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            if checkInput() {
                performSegue(withIdentifier: "goFromFirstScreen", sender: self)
            }
        }
        return false
    }
    
    @objc func hideKeyboard() {
        scrollView?.endEditing(true)
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    @objc func keyboardWillBeHidden(notification: Notification){
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        func CheckUserData() -> Bool {
            let login = loginTextField.text!
            let password = passwordTextField.text!
            
            if login == UserData.rightLogin && password == UserData.rightPassword {
                return true
            } else {
                return false
            }
        }
        
        let checkResult = CheckUserData()
        
        
        if !checkResult {
            showInputError()
        }
        return checkResult
    }
}

extension LoginFormController {
    public func showErrorMessage(title: String, message: String, style: UIAlertController.Style = .alert, closure: () -> ()) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true)
        self.clearAllTextFields(allTextFields: [self.loginTextField, self.passwordTextField])
    }
    
    public func clearAllTextFields(allTextFields: [UITextField]) {
        for textField in allTextFields {
            textField.text = ""
        }
        DispatchQueue.main.async {
            self.loginTextField.becomeFirstResponder()
        }
    }
}
