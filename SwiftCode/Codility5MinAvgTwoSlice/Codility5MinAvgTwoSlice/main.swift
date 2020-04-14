//
//  main.swift
//  Codility5MinAvgTwoSlice
//
//  Created by Cuongpro on 2/24/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation
public func solution(_ A : inout [Int]) -> Int{
    var startIndex = 0
    var average:Float = Float(A[0] + A[1]) / 2.0
    let N = A.count
    for i in 0..<(N - 1) {
        let currentAverage:Float = Float(A[i] + A[i+1]) / 2.0
        if currentAverage < average {
            startIndex = i
            average = currentAverage
        }
        if i < N - 2 {
            let currentAverage:Float = Float(A[i] + A[i+1] + A[i+2]) / 3.0
            if currentAverage < average {
                startIndex = i
                average = currentAverage
            }
        }
    }
    return startIndex
}
//var A = [4, 2, 2, 5, 1, 5, 8]
//var A = [9, 8, 2, 17, 6, 5, 24, 5, 16, 7, 4, 4, 6, 2, 3, 2, 8, 6, 10]
var A = [3, 7, 18, 16, 3, 7, 10, 3, 8, 3]
let index = solution(&A)
print("index = \(index)")

