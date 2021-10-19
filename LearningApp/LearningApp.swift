//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Chris Houghton on 19/10/2021.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
