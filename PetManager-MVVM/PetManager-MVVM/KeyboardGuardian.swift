//
//  KeyboardGuardian.swift
//  PetManager-MVVM
//
//  Created by Wilfred Bradley Tan on 29/10/20.
//

import SwiftUI

class KeyboardGuardian: ObservableObject {
    @Published public var keyboardIsHidden = true

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyBoardDidHide(notification:)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func keyBoardWillShow(notification: Notification) {
        keyboardIsHidden = false
    }

    @objc func keyBoardDidHide(notification: Notification) {
        keyboardIsHidden = true
    }

}
