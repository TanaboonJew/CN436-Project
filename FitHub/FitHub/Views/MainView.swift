//
//  MainView.swift
//  FitHub
//
//  Created by ชลิศา ธรรมราช on 29/4/2567 BE.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var selectedTab: Int = 0
    
    var body: some View {
        Group {
            // check if user is log in or not
//            if viewModel.isSignedIn, let user = viewModel.user {
                accountView()/*for: user*/
//            } else {
//                SignInView()
//            }
        }
    }
    
    @ViewBuilder
//    private func accountView(for user: User) -> some View {
    private func accountView() -> some View {
        VStack(spacing: 0) {
            switch selectedTab {
            case 0:
                HomepageView()
            case 1:
                ActivityView()
            case 2:
                ChallengeView()
            default:
                Text("Selected tab \(selectedTab)")
            }
        }
        
        VStack{
            HStack {
                customTabBarItem(selectedTab: $selectedTab, index: 0, label: "Home", icon: "house.fill")
                customTabBarItem(selectedTab: $selectedTab, index: 1, label: "Activity", icon: "figure.run")
                customTabBarItem(selectedTab: $selectedTab, index: 2, label: "Challenge", icon: "flag.2.crossed.fill")
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    MainView()
}
