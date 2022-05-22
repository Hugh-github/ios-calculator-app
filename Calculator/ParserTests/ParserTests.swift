//
//  ParserTests.swift
//  ParserTests
//
//  Created by dhoney96 on 2022/05/22.
//

import XCTest
@testable import Calculator

class ParserTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }
    
    func test_숫자와_연산기호로_분리해서_숫자만_반환() {
        let input = "123+"
        let resultArray = ["123"]
        
        let array = ExpressionParser.componentsByOperators(from: input)
        
        XCTAssertEqual(resultArray, array)
    }
}
