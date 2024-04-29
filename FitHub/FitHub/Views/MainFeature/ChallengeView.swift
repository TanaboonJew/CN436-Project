//
//  ChallengeView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI

struct ChallengeView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    var body: some View {
        VStack {
            customBackButton
            Text("Challenges")
                .font(.title)
                .padding()
            // Additional UI elements for displaying challenges can be added here
        }
        .navigationBarBackButtonHidden(true)
    }

    var customBackButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")  // Custom icon for back button
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                Text("Back")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView()
    }
}
