//
//  SignUpView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @State private var navigateToNextView = false  // Added state variable for navigation

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Sign Up") {
                signUp()
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            // Navigate to next view upon successful sign-up
            NavigationLink(destination: HomepageView(), isActive: $navigateToNextView) {
                EmptyView()
            }
        }
        .padding()
    }

    private func signUp() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            showErrorAlert = true
            errorMessage = "Please fill in all fields."
            return
        }

        guard password == confirmPassword else {
            showErrorAlert = true
            errorMessage = "Passwords do not match."
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                showErrorAlert = true
                errorMessage = error.localizedDescription
            } else {
                // Navigate to the next view upon successful sign-up
                navigateToNextView = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
