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
    
    func test_숫자와_연산기호_분리해서_반환() {
        let input = "123+456−-789"
        let formula = ExpressionParser.parse(from: input)
        
        let numberArray = [123.0, 456.0, -789.0]
        let operatorArray: [Operator] = [.add, .subtract]
        
        XCTAssertEqual(numberArray, formula.operands.items)
        XCTAssertEqual(operatorArray, formula.operators.items)
    }
}
