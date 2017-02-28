//
//  String_VersionNumberComparisonTests.swift
//  String-VersionNumberComparisonTests
//
//  Created by hashimoto wataru on 2017/02/28.
//  Copyright © 2017年 wataruhash.info. All rights reserved.
//

import XCTest
@testable import String_VersionNumberComparison

func testCompareVersionNumbers(first: String, second: String, expectedResult: ComparisonResult) -> (Bool, Bool) {
    return ((first.compareVersion(with: second) == expectedResult),
            (second.compareVersion(with: first) == expectedResult.inverted))
}

extension ComparisonResult {
    var inverted: ComparisonResult {
        let inverted: ComparisonResult
        switch self {
        case .orderedAscending:
            inverted = .orderedDescending
        case .orderedSame:
            inverted = .orderedSame
        case .orderedDescending:
            inverted = .orderedAscending
        }
        return inverted
    }
}

class String_VersionNumberComparisonTests: XCTestCase {
    func test() {
        XCTAssertTrue(testCompareVersionNumbers(first: "1.0.0",     second: "1.0",     expectedResult: .orderedSame)      == (true, true))
        XCTAssertTrue(testCompareVersionNumbers(first: "1.0",       second: "1.0.1",   expectedResult: .orderedAscending) == (true, true))
        XCTAssertTrue(testCompareVersionNumbers(first: "0.0.0",     second: "1.0.0",   expectedResult: .orderedAscending) == (true, true))
        XCTAssertTrue(testCompareVersionNumbers(first: "0",         second: "1.0.0",   expectedResult: .orderedAscending) == (true, true))
        XCTAssertTrue(testCompareVersionNumbers(first: "10.4.5",    second: "10.4.11", expectedResult: .orderedAscending) == (true, true))
        XCTAssertTrue(testCompareVersionNumbers(first: "2.3.0.001", second: "2.3.0.1", expectedResult: .orderedSame)      == (true, true))
    }
}
