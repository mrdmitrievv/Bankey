//
//  UITextField+SecureToggle.swift
//  Banker
//
//  Created by Артём Дмитриев on 06.02.2023.
//

import UIKit

let secureToggleButton = UIButton(type: .custom)

extension UITextField {
    
    func enablePasswordToggle() {
        secureToggleButton.setImage(UIImage(systemName: "eye"), for: .normal)
        secureToggleButton.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        secureToggleButton.addTarget(self, action: #selector(togglePasswordView), for: .touchUpInside)
        
        rightView = secureToggleButton
        rightViewMode = .always
    }
    
    @objc func togglePasswordView() {
        isSecureTextEntry.toggle()
        secureToggleButton.isSelected.toggle()
    }
}
