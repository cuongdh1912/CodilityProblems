//
//  main.swift
//  Codility15CountDistinctSlices
//
//  Created by Cuongpro on 3/1/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation

public func solution(_ M : Int, _ A : inout [Int]) -> Int {
    var existedNumbers:[Int: Int] = [:]
    var start = 0, end = 0
    var count = 0
    let maximum = 1000000000
    while end < A.count {
        let endNum = A[end]
        if let i = existedNumbers[endNum], i >= start {
            count += (2 * end - start - i) * (i - start + 1) / 2
            existedNumbers[endNum] = end
            start = i + 1
        }else {
            existedNumbers[endNum] = end
        }
        end += 1
        if count > maximum {
            return maximum
        }
    }
    let x = A.count - start
    count += (x + 1) * x / 2
    return min(count, maximum)
}
let M = 6
//var A = [3, 3, 5, 4, 5]
var A = [3, 3, 3, 3, 3]
let result = solution(M, &A)
print(result)
