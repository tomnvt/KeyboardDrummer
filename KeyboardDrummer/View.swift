//
//  View.swift
//  KeyboardDrummer
//
//  Created by NVT on 08.04.18.
//  Copyright © 2018 NVT. All rights reserved.
//

import Cocoa

class View: NSView {
    override func performKeyEquivalent(with event: NSEvent) -> Bool {
        return true
    }
}

