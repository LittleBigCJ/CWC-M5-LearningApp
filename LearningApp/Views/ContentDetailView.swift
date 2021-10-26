//
//  ContentDetailView.swift
//  LearningApp
//
//  Created by Chris Houghton on 26/10/2021.
//

import SwiftUI
import AVKit

struct ContentDetailView: View {
    @EnvironmentObject var model : ContentModel
    
    var body: some View {
        
        let lesson = model.currentLesson
        
        let url = URL(string: Constants.videoHostUrl + (lesson?.video ?? ""))
        VStack{
        if url != nil{
        VideoPlayer(player: AVPlayer(url: url!))
                .cornerRadius(10)
        }
        
        //desc
        
        //next lesson button
            if model.hasNextLesson(){
                Button(action: {
                    
               //advance lesson
                    model.nextLesson()
                    
            }, label: {
                ZStack{
                    Rectangle()
                        .frame(height: 48)
                        .foregroundColor(Color.green)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                    Text("Next lesson: \(model.currentModule!.content.lessons[model.currentLessonIndex + 1].title)").foregroundColor(Color.white)
                        .font(.headline)
                }
            })
            
    }
    }
        .padding()
}
}

struct ContentDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ContentDetailView()
    }
}
