//
//  AuthManager.swift
//  OTPTrial
//
//  Created by Ethelind Septiani Metta on 26/10/25.
//

import Foundation
import Supabase

class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://rblrufztqeyqdtpbwrjj.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJibHJ1Znp0cWV5cWR0cGJ3cmpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjE0NTA4MzIsImV4cCI6MjA3NzAyNjgzMn0._IKFUGn1iQZX8h2PiYhpxLr2DDQgQY4pKk7At0g9I2g")
}
