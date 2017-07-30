//
//  ClosureControlsTests.swift
//  ClosureControlsTests
//
//  Created by Marco Conti on 25.07.17.
//  Copyright © 2017 com.marco83. All rights reserved.
//

import XCTest
@testable import ClosureControls

class ClosureControlsTests: XCTestCase {
    
    func testThatItExecutesClosure() {
        
        // GIVEN
        let expectation = self.expectation(description: "closure called")
        let button = ClosureButton(label: "Test") { _ in
            expectation.fulfill()
        }
        
        // WHEN
        guard let target = button.target, let action = button.action else {
            XCTFail()
            return
        }
        _ = target.perform(action, with: button)
        // THEN
        self.waitForExpectations(timeout: 0)
    }
}
