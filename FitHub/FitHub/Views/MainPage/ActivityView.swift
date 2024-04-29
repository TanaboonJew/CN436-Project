//
//  ActivityView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI
import MapKit

struct ActivityView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject private var locationManager = LocationManager()
    @State private var tracking = false

    var body: some View {
        VStack {
//            customBackButton
            MapView(locationManager: locationManager)  // Corrected usage here
                .frame(height: 300)
            
            Button(tracking ? "Stop Tracking" : "Start Tracking") {
                toggleTracking()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
    
    private func toggleTracking() {
        if tracking {
            locationManager.stopTracking()
        } else {
            locationManager.startTracking()
        }
        tracking.toggle()
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

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
