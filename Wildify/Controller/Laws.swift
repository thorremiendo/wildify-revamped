//
//  Laws.swift
//  Wildify
//
//  Created by Thor Remiendo on 09/11/2019.
//  Copyright © 2019 Thor Remiendo. All rights reserved.
//

import UIKit
import WebKit
class Laws: UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://www.lawphil.net/statutes/repacts/ra2001/ra_9147_2001.html")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
