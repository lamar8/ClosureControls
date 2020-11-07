//
// Copyright (c) 2017 Marco Conti
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

/// A button who executes a closure when pressed
public class ClosureButton: NSButton {
    
    /// The closure invoked when an action is executed
    public var closure: ((Any)->())? = nil
    
    /// The `acceptFirstResponser` method will return this value
    public var overrideAcceptFirstResponder: Bool? = nil
    
    public init(label: String? = nil, closure: ((Any)->())?) {
        super.init(frame: NSRect.zero)
        self.closure = closure
        if let label = label {
            self.title = label
        }
        self.linkActionToButton()
        self.bezelStyle = .rounded
    }
    
    public convenience init(image: NSImage, closure: ((Any)->())?) {
        self.init(closure: closure)
        self.image = image
    }
    
    public override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.linkActionToButton()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func executeClosure(_ sender: Any) {
        self.closure?(sender)
    }
    
    private func linkActionToButton() {
        self.target = self // `target` holds a weak reference
        self.action = #selector(executeClosure(_:))
    }
    
    public override var acceptsFirstResponder: Bool {
        return overrideAcceptFirstResponder ?? super.acceptsFirstResponder
    }
    
}

