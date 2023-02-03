//
//  CurrencyFormatterTests.swift
//  BankerTests
//
//  Created by Артём Дмитриев on 03.02.2023.
//

import Foundation
import XCTest

@testable import Banker

class CurrencyFormatterTests: XCTestCase {
    
    var currencyFormatter: CurrencyFormatter!
    
    override func setUp() {
        super.setUp()
        currencyFormatter = CurrencyFormatter()
    }
    
    func testBreakIntoDollarsAndCents() throws {
        let result = currencyFormatter.breakIntoDollarsAndCents(943560.23)
        XCTAssertEqual(result.0, "943,560")
        XCTAssertEqual(result.1, "23")
    }
    
    func testDollarsFormatted() throws {
        let result = currencyFormatter.dollarsFormatted(943560.23)
        XCTAssertEqual(result, "$943,560.23")
    }
            
    func testZeroDollarsFormatted() throws {
        let result = currencyFormatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
    }
    
}
