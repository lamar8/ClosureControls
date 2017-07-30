//
//  ClosureMenuItem.swift
//  ClosureControls
//
//  Created by Marco Conti on 25.07.17.
//  Copyright © 2017 com.marco83. All rights reserved.
//

import Foundation

/// A menu item who executes a closure when activated
class ClosureMenuItem: NSMenuItem {
    
    /// The closure invoked when an action is executed
    public var closure: ((Any)->())? = nil
    
    public init(title: String, keyEquivalent: String = "", closure: ((Any)->())?) {
        self.closure = closure
        super.init(title: title, action: #selector(self.executeClosure(_:)), keyEquivalent: keyEquivalent)
        self.target = self
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
    
    func executeClosure(_ sender: Any) {
        closure?(sender)
    }
}

