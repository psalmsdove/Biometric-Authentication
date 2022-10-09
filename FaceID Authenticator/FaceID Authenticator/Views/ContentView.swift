//
//  ContentView.swift
//  FaceID Authenticator
//
//  Created by Ali Erdem Kökcik on 9.10.2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        VStack {
            if authenticationManager.isAuthenticated{
                VStack(spacing: 40){
                    Title()
                    Text("Welcome.")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
            } else {
                LoginView()
                    .environmentObject(AuthenticationManager())
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $authenticationManager.showAlert) {
            Alert(title: Text("Error"), message: Text(authenticationManager.errorDescription ?? "Error trying to login with credentials."), dismissButton: .default(Text("Ok.")))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
