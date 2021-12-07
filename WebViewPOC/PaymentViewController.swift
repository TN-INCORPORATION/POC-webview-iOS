//
//  PaymentViewController.swift
//  WebViewPOC
//
//  Created by sarayuth.sa on 22/9/2564 BE.
//

import UIKit

class PaymentViewController: UIViewController {

    @IBOutlet var targetAccountLabel : UILabel?
    @IBOutlet var amountLabel : UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        if let targetAccountStr = UserDefaults.standard.string(forKey: Constants.targetAccountParamKey) {
            targetAccountLabel?.text = targetAccountStr
        } else {
            targetAccountLabel?.text = "Target Account Name"
        }
        
        if let amountStr = UserDefaults.standard.string(forKey: Constants.amountParamKey) {
            amountLabel?.text = "\(amountStr) THB"
        } else {
            amountLabel?.text = "10,000.00 THB"
        }
        
    }
    

}

