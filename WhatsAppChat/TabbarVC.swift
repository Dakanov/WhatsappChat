//
//  TabbarVC.swift
//  WhatsAppChat
//
//  Created by Sultan on 02.11.2022.
//  Copyright © 2022 Dakanov Sultan. All rights reserved.
//

import UIKit

class TabbarVC: UITabBarController {

    // MARK: - Navigation
    override func viewDidLoad() {
        super.viewDidLoad()
        getVCWithNavBar(vc: ViewController())
    }
    
    func getVCWithNavBar(vc: UIViewController){
        self.viewControllers?.append(UINavigationController(rootViewController: vc))
        
    }
    

}
