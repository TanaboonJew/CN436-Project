//
//  SignInView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI
import Firebase


struct SignInView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var showErrorAlert = false
    @State private var errorMessage = ""
    @State private var navigateToNextView = false  // Added state variable for navigation

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button("Sign In") {
                signIn()
            }
            .alert(isPresented: $showErrorAlert) {
                Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
            // Navigate to next view upon successful sign-in
            NavigationLink(destination: HomepageView(), isActive: $navigateToNextView) {
                EmptyView()
            }
        }
        .padding()
    }

    private func signIn() {
        guard !email.isEmpty, !password.isEmpty else {
            showErrorAlert = true
            errorMessage = "Please fill in all fields."
            return
        }

        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                showErrorAlert = true
                errorMessage = error.localizedDescription
            } else {
                // Navigate to the next view upon successful sign-in
                navigateToNextView = true
            }
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
