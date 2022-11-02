//
//  TodayViewController.swift
//  Lets Chat
//
//  Created by Dakanov Sultan on 11.09.2018.
//  Copyright © 2018 Dakanov Sultan. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        
        // Perform any setup necessary in order to update the view.
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    @IBAction func typePressed(_ sender: UIButton) {
        let urlString = "open://"
        let urlStringEncoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let url = URL(string: urlStringEncoded ?? urlString) {
            self.extensionContext?.open(url)
        }
    }

    @IBAction func sendPressed(_ sender: UIButton) {
        let pb: UIPasteboard = UIPasteboard.general
        guard let number = pb.string?.digits else { return }
        let urlString = "whatsapp://send?phone=\(number)"
        if let url = URL(string: urlString), !url.absoluteString.isEmpty {
            self.extensionContext?.open(url)
        }
    }
    
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: self)
    }
    var digits: String {
        return components(separatedBy: CharacterSet.decimalDigits.inverted)
            .joined()
    }
}
