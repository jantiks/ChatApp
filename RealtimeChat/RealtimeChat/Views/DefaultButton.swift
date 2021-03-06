//
//  DefaultButton.swift
//  RealtimeChat
//
//  Created by Tigran on 3/5/21.
//

import UIKit

class DefaultButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        // size
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true

        
        // colors
        self.backgroundColor = UtilsGeneral.defaultColor
        self.setTitleColor(UtilsGeneral.defaultTextColor, for: .normal)
    }
    

}
