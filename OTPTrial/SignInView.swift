//
//  SignInView.swift
//  OTPTrial
//
//  Created by Ethelind Septiani Metta on 26/10/25.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var viewModel: SignInViewModel = SignInViewModel()
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 20) {
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.emailAddress)
                    .padding()
                
                Button("Send OTP") {
                    Task {
                        await viewModel.sendOTP()
                    }
                }
                .buttonStyle(.borderedProminent)
                
                if let error = viewModel.errorMessage {
                    Text(error).foregroundColor(.red)
                }
                
                // Navigation to OTP screen
                if viewModel.isOTPSent {
                    
                    Button ("Go to Detail") {
                        path.append("otp")
                    }
                    
                }
            }
            .padding()
            .navigationDestination(for: String.self) { value in
                otpInput(viewModel: viewModel)
            }
            .navigationTitle("Home")
        }
    }
}

//#Preview {
//    SignInView()
//}
