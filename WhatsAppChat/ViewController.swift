//
//  ViewController.swift
//  WhatsAppChat
//
//  Created by Dakanov Sultan on 21.03.18.
//  Copyright © 2018 Dakanov Sultan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundImage()
        hideKeyboardWhenTappedAround()
        NotificationCenter.default.addObserver(self, selector: #selector(self.hide(notification:)), name: Notification.Name("scrollUp"), object: nil)
    }

    @IBOutlet var textField: UITextField!
   
    

    @IBAction func sendPress(_ sender: UIButton) {
        if textField.text != "" {
            
            let number = textField.text!
            let number1 = number.replacingOccurrences(of: "+", with: "")
            let urlString = "whatsapp://send?phone=\(number1)"
            let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let URL = NSURL(string: urlStringEncoded!)
            if UIApplication.shared.canOpenURL(URL! as URL) {
                UIApplication.shared.openURL(URL! as URL)
            }
            else {
                getAlert()
            }
            
        }
    }

    @objc func hide(notification: Notification){  // Hides searchBar
        if let i = notification.userInfo?["index"] as? String{
            print("get:  \(i)")
            self.textField.text = i
        }
        if textField.text != "" {
            
            let number = textField.text!
            let number1 = number.replacingOccurrences(of: "+", with: "")
            let urlString = "whatsapp://send?phone=\(number1)"
            let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            let URL = NSURL(string: urlStringEncoded!)
            if UIApplication.shared.canOpenURL(URL! as URL) {
                UIApplication.shared.openURL(URL! as URL)
            }
            else {
                //                getAlert()
            }
        }
        
    }
    
    func backgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "whatsappBackground")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
    }
    func getAlert(){
        let alert = UIAlertController(title: nil, message: "Увы, у Вас нет Whatsapp", preferredStyle: UIAlertControllerStyle.alert)
        // add an action (button)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler:{ (action:UIAlertAction!) in
        }))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension UIViewController {   // dissmis keyboard on tap anywhere
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

