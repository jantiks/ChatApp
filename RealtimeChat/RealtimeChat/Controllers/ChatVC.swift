//
//  ChatVC.swift
//  RealtimeChat
//
//  Created by Tigran on 3/6/21.
//

import UIKit

class ChatVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate {

    // MARK: IBOutlets
    @IBOutlet private weak var keyboardHeightLayoutConstraint: NSLayoutConstraint!
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet weak var textView: UIView!
    
    private var lastContentOffset: CGFloat = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // adding observer for keyaboard
        self.addKeyboardListeners()
        self.hideKeyboardWhenTappedAround()
        
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if ((touch.view?.isDescendant(of: view)) != nil) {
            return false
        }
        return true
    }
    
    //MARK: UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") else { fatalError("coudldn't load tableview cell") }
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    //MARK: UITableViewDelegate methods
    
    // this delegate is called when UITableView will start scrolling
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }

    // dissmising the keayboard when user scrolls down
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
       if self.lastContentOffset > scrollView.contentOffset.y {
            // did move down
            print("Down")
            self.view.endEditing(true)
        }
    }
    
    
    //MARK: Keyboard Notifications
    func addKeyboardListeners() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
    }

    @objc private func keyboardWillShow(_ notification: Notification) {
        let userInfo = notification.userInfo
        if let keyboardFrame: NSValue = userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let keyboardRectangle = keyboardFrame.cgRectValue
                let keyboardHeight = keyboardRectangle.height // keyboard height
            // changing the bottom constant of scrollview , so the textfield would be stick with keyboard
            keyboardHeightLayoutConstraint.constant = keyboardHeight - view.safeAreaInsets.bottom
            
            // animating the textfield when keyboard shows up
            let duration:TimeInterval = (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
            let animationCurveRawNSN = userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
            let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
            let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
            
            UIView.animate(
                withDuration: duration,
                delay: TimeInterval(0),
                options: animationCurve,
                animations: { self.view.layoutIfNeeded() },
                completion: nil)
            
                
            }
        }
    @objc private func keyboardWillHide(_ notification: Notification) {
        let userInfo = notification.userInfo
        keyboardHeightLayoutConstraint.constant = 0
        
        // animating the textfield when keyboard hides
        let duration:TimeInterval = (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        
        UIView.animate(
            withDuration: duration,
            delay: TimeInterval(0),
            options: animationCurve,
            animations: { self.view.layoutIfNeeded() },
            completion: nil)
        
            
    }
    
}
