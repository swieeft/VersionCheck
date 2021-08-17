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
        
        let serverVersion = serverText.split(separator: ".")
        let appVersion = appText.split(separator: ".")
        
        
        // Migor, Minor, Patch 순서대로 비교
//        guard let serverMigor = Int(serverVersion[0]),
//              let serverMinor = Int(serverVersion[1]),
//              let serverPatch = Int(serverVersion[2]),
//              let appMigor = Int(appVersion[0]),
//              let appMinor = Int(appVersion[1]),
//              let appPatch = Int(appVersion[2]) else {
//            return
//        }
//
//        if appMigor < serverMigor {
//            resultLabel.text = "\(true)"
//        } else if appMigor == serverMigor {
//            if appMinor < serverMinor {
//                resultLabel.text = "\(true)"
//            } else if appMinor == serverMinor {
//                if appPatch < serverPatch {
//                    resultLabel.text = "\(true)"
//                } else {
//                    resultLabel.text = "\(false)"
//                }
//            } else {
//                resultLabel.text = "\(false)"
//            }
//        } else {
//            resultLabel.text = "\(false)"
//        }

        // Patch, Minor, Migor 순서대로 비교
        var isUpdate = false

        for i in (0..<3).reversed() {
            guard let s = Int(serverVersion[i]), let a = Int(appVersion[i]) else {
                continue
            }

            checkVersion(server: s, app: a, isUpdate: &isUpdate)
        }

        resultLabel.text = "\(isUpdate)"
    }
    
    func checkVersion(server: Int, app: Int, isUpdate: inout Bool) {
        if server > app {
            isUpdate = true
        } else if server < app {
            isUpdate = false
        }
    }
}

