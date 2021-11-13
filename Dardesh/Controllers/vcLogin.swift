//
//  vcLogin.swift
//  Dardesh
//
//  Created by visions tech mac 3 on 7/31/21.
//

import UIKit
import ProgressHUD

class vcLogin: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        txtFieldEmail.delegate = self
        txtFieldPasword.delegate = self
        txtFieldConfirmPassword.delegate = self
      textFieldDidChangeSelection(txtFieldEmail)
      textFieldDidChangeSelection(txtFieldPasword)
      textFieldDidChangeSelection(txtFieldConfirmPassword)
       // hide the forget button at the beginning
      btnForgotPassword.isHidden = true
        
        // Calling the dismissing keyboard tab func
        setUPBackGroundTap()

    }
    
    
    // MARK:- Variables
    var isLogin : Bool = false
    

    
    // MARK:- IBOutlets
    
    // Labels
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblEmail: UILabel!
    @IBOutlet var lblPassword: UILabel!
    @IBOutlet var lblConfirmPassword: UILabel!
    @IBOutlet var lblHaveAnAccount: UILabel!
    
    // TextFields
    @IBOutlet var txtFieldEmail: UITextField!
    @IBOutlet var txtFieldPasword: UITextField!
    @IBOutlet var txtFieldConfirmPassword: UITextField!
    
    // Buttons
    
    @IBOutlet var btnForgotPassword: UIButton!
    @IBOutlet var btnResendEmail: UIButton!
    @IBOutlet var btnRegister: UIButton!
    @IBOutlet var btnLogin: UIButton!
    
    // MARK:- IBActions
    
    @IBAction func btnForgotPasswordPressed(_ sender: UIButton) {
        if isDataInputedFor(mode: "forgotPassword"){
        print("Data is inputed correctly")
            //TODO-: Reset password
        }
        else{
            ProgressHUD.showError("Error,email field is required")
    }
        
    }
    
    @IBAction func btnResendEmailPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func btnRegisterPressed(_ sender: UIButton) {
        if isDataInputedFor(mode: isLogin ? "login" : "register") {
            print("Data is inputed correctly")
            //TODO:- register or login
        }
        else{
            ProgressHUD.showError("Error,All fields are required")

        }
        
    }
    
    @IBAction func btnLoginPressed(_ sender: UIButton) {
        
        updateUIMode(mode:isLogin)
    }
    
    private func updateUIMode(mode:Bool){
        if !mode{
            lblTitle.text = "Login"
            lblConfirmPassword.isHidden = true
            txtFieldConfirmPassword.isHidden = true
            btnRegister.setTitle("Login", for:.normal)
            btnLogin.setTitle("Register", for: .normal)
            btnResendEmail.isHidden = true
            btnForgotPassword.isHidden = false
            lblHaveAnAccount.text = "New Here ?"
        }
        else{
            lblTitle.text = "Register"
            lblConfirmPassword.isHidden = false
            txtFieldConfirmPassword.isHidden = false
            btnRegister.setTitle("Register", for:.normal)
            btnLogin.setTitle("Login", for:.normal)
            btnResendEmail.isHidden = false
            btnForgotPassword.isHidden = true
            
            
        }
        isLogin.toggle()
    }
    
    //Mark:- Helpers or Utilities
    
    private func isDataInputedFor(mode:String) -> Bool{
        switch mode {
        case "login":
        return  txtFieldEmail.text != "" && txtFieldPasword.text != ""
        case "register" :
            return txtFieldEmail.text != "" && txtFieldPasword.text != "" && txtFieldConfirmPassword.text != ""
        case "forgotPassword" :
            return txtFieldEmail.text != ""
        default:
            return false
        }
        
    }
    
    // MARK:- Tap Gesture Recognizer
    private func setUPBackGroundTap (){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func hideKeyboard (){
        view.endEditing(false)
    }
    
}


extension vcLogin:UITextFieldDelegate{
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
     
        
        if txtFieldEmail.hasText == false{
            lblEmail.text = ""
        }
        else {
            lblEmail.text = "Email"
        }
         
        if txtFieldPasword.hasText == false{
            lblPassword.text = ""
        }
        
        else {
            lblPassword.text = "Password"
        }
        
        if txtFieldConfirmPassword.hasText == false{
            lblConfirmPassword.text = ""
        }
        
        else {
            lblConfirmPassword.text = " Confirm Password"
        }
}

}


