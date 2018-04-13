//
//  KeyboardDrummerUITests.swift
//  KeyboardDrummerUITests
//
//  Created by NVT on 13.04.18.
//  Copyright © 2018 NVT. All rights reserved.
//

import XCTest

class KeyboardDrummerUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDrumChange() {
        
        let keyboardDrummerWindow = XCUIApplication().windows["Keyboard Drummer"]
        keyboardDrummerWindow.typeText("a")
        keyboardDrummerWindow.children(matching: .popUpButton).element(boundBy: 0).click()
        keyboardDrummerWindow/*@START_MENU_TOKEN@*/.menuItems["2"]/*[[".popUpButtons",".menus.menuItems[\"2\"]",".menuItems[\"2\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.click()
        keyboardDrummerWindow.typeText("a")
        
    }
    
}
