//
//  Plugin.swift
//  ExamplePlugin
//
//  Created by Joe McBride on 12/6/21.
//

import Foundation
import Plugins

@objc public class ExamplePlugin: NSObject, OPlugin {
    private var host: IHost?
    public var name: String = "Example Plugin"
    
    public required override init() {
        super.init()
    }
    
    public func initialize(host: IHost) {
        self.host = host
    }
    
    public func variableChanged(variable: String, value: String) {
    }

    public func parse(input: String) -> String {
        let trimmed = input.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        guard trimmed.hasPrefix("/example") else {
            return input
        }

        host?.send(text: "#echo Example Plugin v3!")

        return ""
    }
    
    public func parse(xml: String) -> String {
        return xml
    }
    
    public func parse(text: String) -> String {
        return text
    }
}
