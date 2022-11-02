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
    var controllers = [UIViewController]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            getVCWithNavBar(vc: viewController)
        }
        
    }
    
    func getVCWithNavBar(vc: UIViewController){
        controllers.append(UINavigationController(rootViewController: vc))
        self.viewControllers = controllers
    }
    

}
