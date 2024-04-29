//
//  HistoryView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

struct HistoryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var historyEntries: [Activity] = []

    var body: some View {
        VStack {
            customBackButton
            List(historyEntries) { activity in
                HistoryEntryView(activity: activity)
            }
            .onAppear {
                fetchActivities()
            }
        }
        .navigationBarBackButtonHidden(true)
    }

    private func fetchActivities() {
        guard let userID = Auth.auth().currentUser?.uid else { return }

        let db = Firestore.firestore()
        db.collection("activities").document(userID).collection("userActivities")
            .order(by: "date", descending: true)
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    self.historyEntries = querySnapshot?.documents.compactMap { document in
                        try? document.data(as: Activity.self)
                    } ?? []
                }
            }
    }
    
    var customBackButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.blue)
                Text("Back")
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

struct HistoryEntryView: View {
    var activity: Activity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(activity.type)
                .font(.headline)
            Text("Duration: \(activity.duration) minutes")
            Text("Distance: \(activity.distance) km")
            Text("Calories: \(activity.caloriesBurned)")
        }
        .padding()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
