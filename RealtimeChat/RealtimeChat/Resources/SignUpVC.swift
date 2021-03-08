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
    
    @IBOutlet weak var keboardConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        self.hideKeyboardWhenTappedAround()
        
        // adding observer for keyaboard
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardNotification(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
    }
    
    private func setupUI() {
        titleLabel.textColor = UtilsGeneral.defaultColor
        
        emailLabel.textColor = .systemGray3
        passwordLabel.textColor = .systemGray3
        
        forgotPasswordBTN.setTitleColor(UtilsGeneral.defaultColor, for: .normal)

    }
    

    //MARK: Keyboard Notifications
    @objc private func keyboardNotification(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let endFrameY = endFrame?.origin.y ?? 0
        let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        
        if endFrameY >= UIScreen.main.bounds.size.height {
            self.keboardConstraint?.constant = 0.0
        } else {
            self.keboardConstraint?.constant = -(endFrame?.size.height ?? 0.0)
        }
        
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(0),
            options: animationCurve,
            animations: { self.view.layoutIfNeeded() },
            completion: nil)
    }
}
