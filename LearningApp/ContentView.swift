//
//  ContentView.swift
//  LearningApp
//
//  Created by Chris Houghton on 20/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        ScrollView{
            LazyVStack{
                
                //confirm current module is set
                if model.currentModule != nil {
                    ForEach(0..<model.currentModule!.content.lessons.count){ index in
                        
                 ContentViewRow(index: index)
                    }
                }
            }.padding()
                .navigationTitle("Learn \(model.currentModule?.category ?? "")")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
