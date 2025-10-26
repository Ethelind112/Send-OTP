//
//  otpInput.swift
//  OTPTrial
//
//  Created by Ethelind Septiani Metta on 26/10/25.
//

import SwiftUI

struct otpInput: View {
    @StateObject var viewModel: SignInViewModel
    
    var body: some View {
        TextField("Input your otp code here", text: $viewModel.otpCode)
        
        Button("Verify"){
            Task {
                await viewModel.verifyOTP()
            }
        }
        
        
        if let error = viewModel.errorMessage {
            Text(error).foregroundColor(.red)
        }
        
        if viewModel.isLoggedIn {
            Text("🎉 Logged in successfully!")
                .foregroundColor(.green)
        }
    }
}

//#Preview {
//    otpInput()
//}
