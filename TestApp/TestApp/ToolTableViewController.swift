//
//  FirstViewController.swift
//  TestApp
//
//  Created by Oconnell, Madeline on 1/24/20.
//  Copyright © 2020 Oconnell, Madeline. All rights reserved.
//

import UIKit

class ToolTableViewController: UITableViewController, UITextFieldDelegate {
    
    var tools: [Tool] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSampleToolsFromFile()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tools.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "toolReuseCell", for: indexPath) as? ToolTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ToolTableViewCell.")
        }
        let tool = tools[indexPath.section]
        cell.primaryLabel.text = tool.toolType
        cell.secondaryLabel.text = tool.toolDescription
        return cell
    }
    
    /**********************/
    
    private func loadSampleToolsQuick() {
        let tool1 = Tool(toolType: "Hammer",toolDescription: "Stanley Pro",toolImage: UIImage(named: "first"))
        let tool2 = Tool(toolType: "Wrench",toolDescription: "Stanley Pro",toolImage: nil)
        let tool3 = Tool(toolType: "Screwdriver",toolDescription: "Stanley Pro",toolImage: nil)
        let tool4 = Tool(toolType: "Wrench",toolDescription: "Stanley Pro",toolImage: nil)
        let tool5 = Tool(toolType: "Dremel",toolDescription: "Stanley Pro",toolImage: nil)

        tools.append(tool1)
        tools.append(tool2)
        tools.append(tool3)
        tools.append(tool4)
        tools.append(tool5)
    }

    private func loadSampleToolsFromString() {
        let jsonString: String =
        """
        {
           "tools__c":{
              "Hammer":"Stanley 5oz. Pro",
              "Screwdriver":"Craftsman 9-31794 Slotted Phillips",
              "Wrench1":"RIDGID 31035 Model 36",
              "Wrench2":"Craftsman 10Mm 12-Point Metric Standard",
              "Dremel":"Dremel 7300-PT 4.8V"
           }
        }
        """
        
        tools = ToolJSONHandler(jsonString: jsonString).getTools()
    }
    
    private func loadSampleToolsFromFile() {
        let jsonPath = Bundle.main.path(forResource: "tools", ofType: "json") ?? ""
        tools = ToolJSONHandler(pathAsString: jsonPath).getTools()
    }

}

