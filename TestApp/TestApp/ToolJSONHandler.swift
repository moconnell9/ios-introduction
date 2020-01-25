//
//  ToolManager.swift
//  TestApp
//
//  Created by Oconnell, Madeline on 1/24/20.
//  Copyright © 2020 Oconnell, Madeline. All rights reserved.
//

import UIKit

class ToolJSONHandler {
    var json: Any?
    var data: Data
    
    public init(pathAsString: String) { //pathAsString: pass in the filepath of the JSON
        var tempData: Data = Data()
        do {
            tempData = try Data(contentsOf: URL(fileURLWithPath: pathAsString))
        }
        catch {
            print(error.localizedDescription)
        }
        self.data = tempData
        self.json = try? JSONSerialization.jsonObject(with: self.data)
    }
    
    public init(jsonString: String) {
        var tempData: Data = Data()
        tempData = jsonString.data(using: .utf8)! //doing a bad thing (!) for demonstration purposes
        self.data = tempData
        self.json = try? JSONSerialization.jsonObject(with: self.data)
    }
    
    /*******************/
    
    public func getTools() -> [Tool] {
        var tools: [Tool] = []
        if let toolbox = json as? [String: Any] {
            if let tempTools = toolbox["tools__c"] as? [String: String] {
                for tool in tempTools {
                    let tempTool = Tool(toolType: tool.key, toolDescription: tool.value, toolImage: nil)
                    tools.append(tempTool)
                }
            }
        }
        return tools
    }
    
    public func getWrenches() -> [Tool] {
        var wrenches: [Tool] = []
        if let toolbox = json as? [String: Any] {
            if let tools = toolbox["tools__c"] as? [String: String] {
                for tool in tools {
                    if tool.key.contains("Wrench") {
                        let tempTool = Tool(toolType: tool.key, toolDescription: tool.value, toolImage: nil)
                        wrenches.append(tempTool)
                    }
                }
            }
        }
        return wrenches
    }
}
