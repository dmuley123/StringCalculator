//
//  StringCalculatorUITests.swift
//  StringCalculatorUITests
//
//  Created by Dnyaneshwar Muley on 28/06/25.
//

import XCTest
@testable import StringCalculator

final class StringCalculatorTests: XCTestCase {
    
    var calculator: StringCalculatorViewModel!
    
    override func setUp() {
        super.setUp()
        calculator = StringCalculatorViewModel()
    }
    
    func testEmptyStringReturnsZero() throws {
        XCTAssertEqual(try calculator.add(""), 0)
    }
    
    func testOneNumberReturnsSameNumber() throws {
        XCTAssertEqual(try calculator.add("5"), 5)
    }
    
    func testTwoNumbersCommaSeparatedReturnsSum() throws {
        XCTAssertEqual(try calculator.add("1,2"), 3)
    }
    
    func testMultipleNumbers() throws {
        XCTAssertEqual(try calculator.add("1,2,3,4"), 10)
    }
    
    func testSupportsNewlineAsDelimiter() throws {
        XCTAssertEqual(try calculator.add("1\n2,3"), 6)
    }
    
    func testCustomDelimiter() throws {
        XCTAssertEqual(try calculator.add("//;\n1;2"), 3)
    }
    
    func testNegativeNumberThrowsError() {
        XCTAssertThrowsError(try calculator.add("1,-2,3")) { error in
            XCTAssertEqual(error.localizedDescription, "Negative numbers not allowed: -2")
        }
    }
    
    func testMultipleNegativeNumbers() {
        XCTAssertThrowsError(try calculator.add("-1,-2,-3")) { error in
            XCTAssertEqual(error.localizedDescription, "Negative numbers not allowed: -1, -2, -3")
        }
    }
}

