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
    
    @Published var currentModule: Module?
    var currentModuleIndex = 0
    
    
    var styleData: Data?
    
    init(){
        getLocalData()
        
    }
    
    // MARK: - Data Methods
    
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
    // MARK: - Module Navigation Methods
    
    func beginModule(_ moduleid:Int){
        //find index for module id
        for index in 0..<modules.count{
            if modules[index].id == moduleid {
                currentModuleIndex = index
                break
            }
        }
        //set current module
        currentModule = modules[currentModuleIndex]
    }
}



