//
//  User.swift
//  FitHub
//
//  Created by ชลิศา ธรรมราช on 29/4/2567 BE.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable {
    var id: String?
    var name: String
    let email: String
    var tel: String
    var gender: Gender
    let joined: TimeInterval
    var role: UserRole
    var weight: Double
    var height: Double
    var age: Int
}

enum Gender: String, Codable, CaseIterable {
    case male = "male"
    case female = "female"
    case lgbt = "lgbt"
    case undefined = "undefined"
    
    var displayName: String {
        switch self {
        case .male:
            return "Male"
        case .female:
            return "Female"
        case .lgbt:
            return "LGBT"
        case .undefined:
            return "Undefined"
        }
    }
}

enum UserRole: String, Codable, CaseIterable {
    case user = "user"
    case admin = "admin"
    case cooperator = "cooperator"
    
    var displayName: String {
        switch self {
        case .user:
            return "User"
        case .admin:
            return "Admin"
        case .cooperator:
            return "Cooperator"
        }
    }
    
    var isUser: Bool {
        self == .user
    }
    
    var isAdmin: Bool {
        self == .admin
    }
    
    var isCooperator: Bool {
        self == .cooperator
    }
}
