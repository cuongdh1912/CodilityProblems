//
//  main.swift
//  Codility6NumberOfDiscIntersections
//
//  Created by Cuongpro on 2/25/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation
/*
func intersec(p1x1: Int, p1x2: Int, p2x1: Int, p2x2: Int) ->Bool {
    return (p1x1 >= p2x1 && p1x1 <= p2x2) || (p1x2 >= p2x1 && p1x2 <= p2x2) ||
        (p2x1 >= p1x1 && p2x1 <= p1x2) || (p2x2 >= p1x1 && p2x2 <= p1x2)
}
public func solution(_ A : inout [Int]) -> Int {
    var a = A
    var index = 0
    var result = 0
    while index < a.count - 1 {
        let left = index - a[index]
        let right = index + a[index]
        for i in (index + 1)..<a.count {
            let left2 = i - a[i]
            let right2 = i + a[i]
            if intersec(p1x1: left, p1x2: right, p2x1: left2, p2x2: right2) {
                result += 1
            }else {
                print("NO")
            }
        }
        index += 1
    }
    return result
}
 */
var A = [1, 5, 2, 1, 4, 0]
public func solution(_ A : inout [Int]) -> Int {
    var sum = 0,
        len = A.count,
        startArr:[Int] = [Int](repeatElement(0, count: len)),
        endArr:[Int] = [Int](repeatElement(0, count: len)),
        active = 0
    
    // sort start and end boundaries of the discs into their own arrays
    for i in 0..<len {
        if i < A[i] {
            startArr[0] += 1
        } else {
            startArr[i - A[i]] += 1;
        }
        if (i + A[i] >= len) {
            endArr[len - 1] += 1;
        }else {
            endArr[i + A[i]] += 1;
        }
    }
    for i in 0..<len {
        sum += startArr[i] * active + startArr[i] * (startArr[i] - 1) / 2
        active += startArr[i] - endArr[i]
    }
    return sum
}
let result = solution(&A)
print(result)

