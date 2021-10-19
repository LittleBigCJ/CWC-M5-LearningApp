//
//  ContentModel.swift
//  LearningApp
//
//  Created by Chris Houghton on 19/10/2021.
//

import Foundation
import SwiftUI

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    var styleData: Data?
    
    init(){
        getLocalData()
        
    }
    
    func getLocalData(){
        //get a url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        //read the file into a data object
        do {
            //try to decode the json into an array of modules
            let jsonData = try Data(contentsOf: jsonUrl!)
            let jsonDecoder = JSONDecoder()
            
            let modules = try jsonDecoder.decode([Module].self, from: jsonData)
            //assign parsed modules to modules property
            self.modules = modules
            
        }
        catch {
            //log error
            print("Couldn't parse local data")
        }
        //parse the style data
        //get a url to the json file
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        //read the file into a data object
        do {
            //try to decode the json into an array of modules
            let styleData = try Data(contentsOf: styleUrl!)
            self.styleData = styleData
            
        }
        catch {
            
            print("Coudn't parse style data")
            
            
        }
        
    }
    
}



