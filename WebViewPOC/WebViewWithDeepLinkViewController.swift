//
//  WebViewWithDeepLinkViewController.swift
//  WebViewPOC
//
//  Created by sarayuth.sa on 22/9/2564 BE.
//

import UIKit
import WebKit

class WebViewWithDeepLinkViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {

    @IBOutlet var webView : WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.uiDelegate = self
        webView.navigationDelegate = self
        let webURL = URL(string: Constants.webViewCompleteURL)
        let webRequest = URLRequest(url: webURL!)
        webView.load(webRequest)
        
    }

    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        
        
        if let url = navigationAction.request.url, let scheme = url.scheme?.lowercased() {
            //check the url scheme to bring user to specific apps other than safari

            if scheme != "https" && scheme != "http" {
                if UIApplication.shared.canOpenURL(url){
                    // use the available apps in user's phone
                    UIApplication.shared.open(url)
                }
            }
        }
        
        decisionHandler(.allow)
    }
    
}
