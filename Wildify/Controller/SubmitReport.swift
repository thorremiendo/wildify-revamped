//
//  SubmitReport.swift
//  SafariAR
//
//  Created by Thor Remiendo on 09/11/2019.
//  Copyright © 2019 ZET. All rights reserved.
//

import Foundation
import UIKit

class SubmitReport: UIViewController {
    override func viewWillAppear(_ animated: Bool) {
       
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBAction func report(_ sender: Any) {
        let id = "denrbiodiversity"
        // If you have User id the use this URL
        let urlWithId = "fb-messenger://user-thread/\(id)"
        // If you don't have User id then use this URL
        let urlWithoutId = "fb-messenger://user-thread"
        if let url = URL(string: urlWithId) {

            // this will open your Messenger App
            UIApplication.shared.open(url, options: [:], completionHandler: {
                (success) in

                if success == false {
                    // If Messenger App is not installed then it will open browser.
                    // If you have User id the use this URL
                    let urlWithIdForBrowser = "https://m.me/\(id)"
                    // If you don't have User id then use this URL
                    let urlWithoutIdForBrowser = "https://m.me"
                    let url = URL(string: urlWithIdForBrowser)
                    if UIApplication.shared.canOpenURL(url!) {
                        UIApplication.shared.open(url!)
                    }
                }
            })
        }
    }
    
}
