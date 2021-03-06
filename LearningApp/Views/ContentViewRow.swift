//
//  ContentViewRow.swift
//  LearningApp
//
//  Created by Chris Houghton on 20/10/2021.
//

import SwiftUI

struct ContentViewRow: View {
    
    @EnvironmentObject var model: ContentModel
    var index: Int
    
    var body: some View {
        let lesson = model.currentModule!.content.lessons[index]
        ZStack(alignment: .leading){
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(height:66)
            
            HStack(spacing: 30){
                Text(String(index + 1))
                    .font(.headline)
                VStack(alignment: .leading){
                    Text(lesson.title)
                        .font(.headline)
                    Text(lesson.duration)
                }
            }.padding()
        }.padding(.bottom, 5)
    }
}

