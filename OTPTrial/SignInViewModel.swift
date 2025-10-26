//
//  SignInViewModel.swift
//  OTPTrial
//
//  Created by Ethelind Septiani Metta on 26/10/25.
//

import Foundation
import Combine
import Supabase

class SignInViewModel: ObservableObject {
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://rblrufztqeyqdtpbwrjj.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJibHJ1Znp0cWV5cWR0cGJ3cmpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE0NTA4MzIsImV4cCI6MjA3NzAyNjgzMn0._IKFUGn1iQZX8h2PiYhpxLr2DDQgQY4pKk7At0g9I2g")

    @Published var email: String = ""
    @Published var otpCode: String = ""
    @Published var isOTPSent = false
    @Published var isLoggedIn = false
    @Published var errorMessage: String?
    
    func sendOTP() async {
        do {
            try await client.auth.signInWithOTP(
                email: email,
                shouldCreateUser: true  // or false if you want only existing users
            )
            isOTPSent = true
            print("✅ OTP sent to \(email)")
        } catch {
            errorMessage = "Failed to send OTP: \(error.localizedDescription)"
            print("❌ \(error)")
        }
    }
    
    func verifyOTP() async {
        do {
            let session = try await client.auth.verifyOTP(
                email: email,
                token: otpCode,
                type: .email
            )
            print("✅ Session: \(session.session?.accessToken ?? "No Session")")
            isLoggedIn = true
        } catch {
            errorMessage = "Invalid OTP: \(error.localizedDescription)"
            print("❌ \(error)")
        }
    }
}
