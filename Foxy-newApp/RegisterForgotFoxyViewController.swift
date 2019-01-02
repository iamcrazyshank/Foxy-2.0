//
//  RegisterFoxyViewController.swift
//  Foxy-newApp
//
//DONOT FORGET TO LOGIN TO FIRE BASE AND ENABLE THE EMAIL AUTH button
// DOWNLOAD THE P LIST AND ADD TO Project

import UIKit
import FirebaseAuth

//Registeration page....forgot funtion not implemented, you can check on firebase docs...its pretty simple.

class RegisterForgotFoxyViewController: UIViewController {

    @IBOutlet weak var registerEmail: UITextField!
    @IBOutlet weak var registerPass: UITextField!
    @IBOutlet weak var confirmPass: UITextField!
    
    
    @IBAction func backToLogin(_ sender: Any) {
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func regiterButtonPressed(_ sender: Any) {
        
        if registerEmail.text == "" && confirmPass.text == "" && registerPass.text == ""{
            let alertController = UIAlertController(title: "Error", message: "Please enter your email & password", preferredStyle: .alert)
        
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
            
        }else if confirmPass.text != registerPass.text {
            let alertController = UIAlertController(title: "Error", message: "Both passwords dont match. Please check and re-enter", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        }else{
            //register a new user acc in firebase
            Auth.auth().createUser(withEmail: registerEmail.text!, password: confirmPass.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                   
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "NavigationHome")
                    self.present(vc!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
   
        }
        
     
    }
   

}
}

