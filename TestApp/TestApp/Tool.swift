//
//  Tool.swift
//  TestApp
//
//  Created by Oconnell, Madeline on 1/24/20.
//  Copyright © 2020 Oconnell, Madeline. All rights reserved.
//

import UIKit

class Tool: NSObject {
    var toolType: String?
    var toolDescription: String?
    var toolImage: UIImage?
    
    public init(toolType: String, toolDescription: String, toolImage: UIImage?) {
        self.toolType = toolType
        self.toolDescription = toolDescription
        self.toolImage = toolImage
    }
}
