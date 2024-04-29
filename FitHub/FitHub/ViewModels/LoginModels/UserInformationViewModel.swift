//
//  UserInformationViewModel.swift
//  FitHub
//
//  Created by ชลิศา ธรรมราช on 29/4/2567 BE.
//

import SwiftUI

class UserInformationViewModel: ObservableObject {
    @Published var name = ""
    @Published var tel = ""
    @Published var height = ""
    @Published var weight = ""
    @Published var age = ""
    @Published var gender = Gender.undefined
    
    
}

