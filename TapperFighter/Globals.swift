//
//  Globals.swift
//  TapperFighter
//
//  Created by Tuba N. Yıldız on 13.11.2022.
//

import Foundation


struct Globals {
    struct UserDefaults {
        @UserDefaultWrapperAPI(key: "UD-User", defaultValue: nil)
            static var user: [User]?
    }
}
