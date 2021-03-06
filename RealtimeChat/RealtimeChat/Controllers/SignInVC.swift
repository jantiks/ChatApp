//
//  ViewController.swift
//  RealtimeChat
//
//  Created by Tigran on 3/4/21.
//

import UIKit

class SignInVC: UIViewController {
    // MARK: IBOutlets
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var emailTF: UITextField!
    @IBOutlet private weak var passwordLabel: UILabel!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var forgotPasswordBTN: UIButton!
    @IBOutlet private weak var registerBTN: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {

        navigationController?.navigationBar.tintColor = UtilsGeneral.defaultColor
        
        titleLabel.textColor = UtilsGeneral.defaultColor
        
        emailLabel.textColor = .systemGray3
        passwordLabel.textColor = .systemGray3
        
        forgotPasswordBTN.setTitleColor(UtilsGeneral.defaultColor, for: .normal)
        registerBTN.setTitleColor(UtilsGeneral.defaultColor, for: .normal)
        
    }
    
    
    // MARK: IBActions
    @IBAction private func signInTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: UtilsGeneral.NEW_STORYBOARD_NAME, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: UtilsGeneral.SBID_ChatVC) as? ChatVC else { return }

        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction private func registerTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: UtilsGeneral.NEW_STORYBOARD_NAME, bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: UtilsGeneral.SBID_SignUpVC) as? SignUpVC else { return }

        navigationController?.pushViewController(vc, animated: true)
    }
    
    


}

