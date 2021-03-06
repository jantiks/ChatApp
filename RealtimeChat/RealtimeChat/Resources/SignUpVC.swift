//
//  SignUpVC.swift
//  RealtimeChat
//
//  Created by Tigran on 3/6/21.
//

import UIKit

class SignUpVC: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var signUpBTN: DefaultButton!
    @IBOutlet private weak var forgotPasswordBTN: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
    
    private func setupUI() {
        titleLabel.textColor = UtilsGeneral.defaultColor
        
        emailLabel.textColor = .systemGray3
        passwordLabel.textColor = .systemGray3
        
        forgotPasswordBTN.setTitleColor(UtilsGeneral.defaultColor, for: .normal)

    }
    

}
