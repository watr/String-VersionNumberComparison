//
//  String+VersionNumber.swift
//
//  Created by hashimoto wataru on 2017/02/28.
//  Copyright © 2017年 wataruhash.info. All rights reserved.
//

import Foundation

extension String {
    func compareVersion(with anotherVersionString: String) -> ComparisonResult {
        
        func zipVersionNumbers(first: String, second: String) -> Zip2Sequence<[String], [String]>{
            
            func componentsFilledByZero(components: [String], resultComponentsCount: Int) -> [String] {
                if !(components.count < resultComponentsCount) {
                    return components
                }
                
                var mutated = components
                let appendCount = resultComponentsCount - components.count
                if appendCount > 0 {
                    mutated.append(contentsOf: [String](repeating: "0", count: appendCount))
                }
                return mutated
            }
            
            let firstComponents = first.components(separatedBy: ".")
            let secondComponents = second.components(separatedBy: ".")
            let maxCount = max(firstComponents.count, secondComponents.count)
            
            return zip(componentsFilledByZero(components: firstComponents, resultComponentsCount: maxCount),
                       componentsFilledByZero(components: secondComponents, resultComponentsCount: maxCount))
        }
        
        let result: ComparisonResult = zipVersionNumbers(first: self, second: anotherVersionString).reduce(.orderedSame) { (pre, component) in
            if pre != .orderedSame {
                return pre
            }
            return component.0.compare(component.1, options: .numeric)
        }
        return result
    }
}
