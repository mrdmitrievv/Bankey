//
//  LocalState.swift
//  Banker
//
//  Created by Артём Дмитриев on 25.01.2023.
//

import UIKit

public class LocalState {
    
    private enum Keys: String {
        case hasOnboarded
    }
    
    static var hasOnboarded: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.hasOnboarded.rawValue)
        }
        set(newvalue) {
            UserDefaults.standard.set(newvalue, forKey: Keys.hasOnboarded.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
    
}
