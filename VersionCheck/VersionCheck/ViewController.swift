//
//  ViewController.swift
//  VersionCheck
//
//  Created by swieeft on 2021/08/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var serverTextField: UITextField!
    @IBOutlet weak var appTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func compareButtonAction(_ sender: Any) {
        guard let serverText = serverTextField.text, let appText = appTextField.text else {
            return
        }
        
        let server = serverText.split(separator: ".")
        let app = appText.split(separator: ".")
        
        var isUpdate = false
        
        for i in (0..<3).reversed() {
            guard let s = Int(server[i]), let a = Int(app[i]) else {
                continue
            }
            
            checkVersion(server: s, app: a, isUpdate: &isUpdate)
        }
        
        resultLabel.text = "\(isUpdate)"
    }
    
    func checkVersion(server: Int, app: Int, isUpdate: inout Bool) {// -> Bool {
        if server > app {
            isUpdate = true
        } else if server < app {
            isUpdate = false
        }
    }
}

