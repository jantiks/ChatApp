//
//  Extensions.swift
//  RealtimeChat
//
//  Created by Tigran on 3/6/21.
//

import Foundation
import UIKit

extension UIViewController {
    // hides keyboard when user tapps on screen
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

