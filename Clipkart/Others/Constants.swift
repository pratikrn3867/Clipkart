//
//  Constants.swift
//  ClipkartPlus
//
//  Created by pratik.nalawade on 31/10/24.
//

import Foundation

extension String {

    func localized() -> String {
         let defaultLanguage = Locale.preferredLanguages.first?.components(separatedBy: "-").first
            return NSLocalizedString(self, comment: "")
        }
    }

enum ViewStrings: String {
    func getText() -> String {
        rawValue.localized()
    }
    
    // MARK: - Common
    case emailPlaceholder = "Email and Phone number!"
    case blank = ""
    case dash = "-"
    case space = " "
}
