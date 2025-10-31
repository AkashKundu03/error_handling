//
//  error_handlingApp.swift
//  error handling
//
//  Created by Akash Kundu on 31/10/25.
//
import SwiftUI

@main
struct error_handlingApp: App {
    var body: some Scene {
        WindowGroup {
            LoominoteErrorView(
                title: "We couldn’t analyze this note",
                message: "Please go back to your notes and try again.",
                primaryAction: {
                    // here you’ll later navigate to Dashboard / Notes
                    // for now we can just print or do nothing
                    print("Back to notes tapped")
                }
            )
        }
    }
}
