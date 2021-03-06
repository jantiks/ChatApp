//
//  ViewController.swift
//  RealtimeChat
//
//  Created by Tigran on 3/4/21.
//

import UIKit

class SignInVC: UIViewController {
    // MARK: IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var forgotPasswordBTN: UIButton!
    @IBOutlet weak var registerBTN: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        titleLabel.textColor = UtilsGeneral.defaultColor
        
        emailLabel.textColor = .systemGray3
        passwordLabel.textColor = .systemGray3
        
        forgotPasswordBTN.setTitleColor(UtilsGeneral.defaultColor, for: .normal)
        registerBTN.setTitleColor(UtilsGeneral.defaultColor, for: .normal)
        
    }


}

