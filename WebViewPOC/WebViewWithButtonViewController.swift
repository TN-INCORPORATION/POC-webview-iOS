//
//  WebViewWithButtonViewController.swift
//  WebViewPOC
//
//  Created by sarayuth.sa on 22/9/2564 BE.
//

import UIKit
import WebKit

class WebViewWithButtonViewController: UIViewController, WKUIDelegate {

    @IBOutlet var webView : WKWebView!
    @IBOutlet var paymentButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        webView.uiDelegate = self
        let webURL = URL(string: Constants.webViewNoPaymentURL)
        let webRequest = URLRequest(url: webURL!)
        webView.load(webRequest)
        
    }

    @IBAction func paymentButtonPressed(sender : UIButton) {
        print(" = Payment Button Pressed = ")
        print(" = Try to Get Web Content = ")
        
        webView.evaluateJavaScript("document.documentElement.outerHTML.toString()",
                                   completionHandler: { (html: Any?, error: Error?) in
            if html != nil {
                print(html!)
                
                let webContent : String? = String(describing: html)
                
                if webContent != nil {
                    //if webContent!.contains("make-payment-button") {
                    if webContent!.contains("make-payment-button") {
                        // Change to target page
                        UserDefaults.standard.removeObject(forKey: Constants.targetAccountParamKey)
                        UserDefaults.standard.removeObject(forKey: Constants.amountParamKey)
                        UserDefaults.standard.synchronize()
                        
                        if let tabBarController = self.tabBarController {
                            tabBarController.selectedIndex = 2
                        }
                        
                    } else {
                        let alert = UIAlertController(title: "Processing Error", message: "Please continue registration process until the last page.", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                } else {
                    let alert = UIAlertController(title: "Processing Error", message: "Web page is still loading.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            } else {
                print("!! Page Still Loading !!!")
                
                let alert = UIAlertController(title: "Processing Error", message: "Web page is still loading.", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
    }
    
    
}
