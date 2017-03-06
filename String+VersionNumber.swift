//
//  String+VersionNumber.swift
//
//  Created by hashimoto wataru on 2017/02/28.
//  Copyright © 2017年 wataruhash.info. All rights reserved.
//

import Foundation

extension String {
    func compareVersion(with anotherVersionString: String) -> ComparisonResult {
        let string1 = self
        let string2 = anotherVersionString
        
        let separator: String = "."
        
        let components1 = string1.components(separatedBy: separator)
        let components2 = string2.components(separatedBy: separator)
        let maxCount = max(components1.count, components2.count)
        
        for i in 0..<maxCount {
            let zero: String = "0"
            let a: String = (i < components1.count) ? components1[i] : zero
            let b: String = (i < components2.count) ? components2[i] : zero
            
            let result = a.compare(b, options: .numeric)
            if result != .orderedSame {
                return result
            }
        }
        return .orderedSame
    }
}
