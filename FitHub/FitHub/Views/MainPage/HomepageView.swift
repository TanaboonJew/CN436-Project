//
//  HomepageView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI

struct HomepageView: View {
    @StateObject private var locationManager = LocationManager()  // Create a StateObject for locationManager

    var body: some View {        
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Welcome, User!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    
                    Text("What would you like to do today?")
                        .font(.title2)
                        .padding(.vertical, 10)
                    
//                    NavigationLink(destination: ActivityView().navigationBarHidden(true)) {
//                        FeatureTile(title: "Track Activity", iconName: "figure.walk")
//                    }
//                    
//                    NavigationLink(destination: ChallengeView().navigationBarHidden(true)) {
//                        FeatureTile(title: "Join a Challenge", iconName: "rosette")
//                    }
                    
                    NavigationLink(destination: ProfileView().navigationBarHidden(true)) {
                        FeatureTile(title: "View Profile", iconName: "person.crop.circle")
                    }
                    
                    NavigationLink(destination: HistoryView().navigationBarHidden(true)) {
                        FeatureTile(title: "View History", iconName: "clock.arrow.circlepath")
                    }
                    
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct FeatureTile: View {
    var title: String
    var iconName: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(.blue)
                .padding(.trailing, 20)
            
            Text(title)
                .font(.title3)
                .fontWeight(.medium)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct HomepageView_Previews: PreviewProvider {
    static var previews: some View {
        HomepageView()
    }
}

