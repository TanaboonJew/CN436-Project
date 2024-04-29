//
//  UserInformationView.swift
//  FitHub
//
//  Created by ชลิศา ธรรมราช on 29/4/2567 BE.
//

import SwiftUI
import Firebase

struct UserInformationView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var name: String = ""
    @State private var tel: String = ""
    @State private var gender: Gender = .undefined
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var age: String = ""
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    
    @State private var navigateToNextView = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Telephone", text: $tel)
                    Picker("Gender", selection: $gender) {
                        ForEach(Gender.allCases, id: \.self) { gender in
                            Text(gender.displayName).tag(gender)
                        }
                    }
                    TextField("Weight (kg)", text: $weight)
                        .keyboardType(.decimalPad)
                    TextField("Height (cm)", text: $height)
                        .keyboardType(.decimalPad)
                    TextField("Age", text: $age)
                        .keyboardType(.numberPad)
                }

                Button("Save") {
                    saveUserInfo()
                }
                
                NavigationLink(destination: MainView(), isActive: $navigateToNextView) {
                    EmptyView()
                }
            }
            .navigationBarTitle("Complete Profile", displayMode: .inline)
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }

    private func saveUserInfo() {
        guard !name.isEmpty, !tel.isEmpty, let userWeight = Double(weight), let userHeight = Double(height), let userAge = Int(age) else {
            errorMessage = "Please fill in all fields correctly."
            showErrorAlert = true
            return
        }
        
        if let id = Auth.auth().currentUser?.uid {
            
            let user = User(
                id: id,
                name: name,
                email: Auth.auth().currentUser?.email ?? "",
                tel: tel,
                gender: gender,
                joined: Date().timeIntervalSince1970,
                role: .user,
                weight: userWeight,
                height: userHeight,
                age: userAge
            )
            
            let db = Firestore.firestore()
            
            db.collection("users")
                .document(id)
                .setData(user.asDictionary())
        }

        // Save user information to Firebase
        
//        let ref = Database.database().reference()
//        let usersRef = ref.child("users").child(user.email)
//        usersRef.setValue([
//            "name": user.name,
//            "email": user.email,
//            "tel": user.tel,
//            "gender": user.gender.rawValue,
//            "joined": user.joined,
//            "role": user.role.rawValue,
//            "weight": user.weight,
//            "height": user.height,
//            "age": user.age
//        ]) { error, _ in
//            if let error = error {
//                errorMessage = error.localizedDescription
//                showErrorAlert = true
//            } else {
//                // Possibly navigate back or to a confirmation screen
//                presentationMode.wrappedValue.dismiss()
//                navigateToNextView = true
//            }
//        }
    }
}

#Preview {
    UserInformationView()
}
