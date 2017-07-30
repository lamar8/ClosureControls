//
//  ClosureMenuItem.swift
//  ClosureControls
//
//  Created by Marco Conti on 30.07.17.
//  Copyright © 2017 com.marco83. All rights reserved.
//

import XCTest
@testable import ClosureControls

class ClosureMenuItemTests: XCTestCase {
    
    func testThatItExecutesClosure() {
        
        // GIVEN
        let expectation = self.expectation(description: "closure called")
        let menuItem = ClosureMenuItem(title: "Test") { _ in
            expectation.fulfill()
        }
        
        // WHEN
        guard let target = menuItem.target, let action = menuItem.action else {
            XCTFail()
            return
        }
        _ = target.perform(action, with: menuItem)
        
        // THEN
        self.waitForExpectations(timeout: 0)
    }
}
