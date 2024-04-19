//
//  MainPageView.swift
//  FitHub
//
//  Created by นายธนบูรณ์ จิวริยเวชช์ on 4/19/24.
//

import SwiftUI

struct MainPageView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Fithub").font(.largeTitle)
                NavigationLink(destination: SignInView()) {
                    Text("Sign In")
                }
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                }
            }
        }
    }
}



struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
