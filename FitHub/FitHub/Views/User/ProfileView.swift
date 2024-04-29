//
//  ProfileView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI
import Firebase

struct ProfileView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            customBackButton
            // Your existing code for profile content
            Text("Profile")
            Button("Sign Out") {
                do {
                    try Auth.auth().signOut()
                } catch {
                    print("Error signing out: \(error.localizedDescription)")
                }
            }
        }
        .navigationBarBackButtonHidden(true)  // Hides the default back button
    }
    
    var customBackButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left") // Custom icon for back button
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                Text("Back")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
