//
//  CreateAccountViewModel.swift
//  Clipkart
//
//  Created by pratik.nalawade on 25/10/24.
//

import Foundation
import CoreData
import UIKit

class CreateAccountViewModel: ObservableObject {
    var userTags: [UserTags] = []
    @Published var email: String =   ""
    @Published var fullName: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    
}
