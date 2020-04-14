//
//  main.swift
//  Codility11CountNonDivisible
//
//  Created by Cuongpro on 2/29/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int]) -> [Int] {
    let N = A.count
    var D: [[Int]] = [[Int]](repeatElement([0, -1], count: N * 2))
    for a in A {
        D[a][0] += 1
    }
    
    for a in A {
        let middle = Int(sqrt(Double(a)))
        if D[a][1] == -1 {
            D[a][1] = 0
            for j in 1...middle {
                if a % j == 0 {
                    D[a][1] += D[j][0]
                    if a / j != j {
                        D[a][1] += D[a / j][0]
                    }
                }
            }
        }
    }
    var result:[Int] = []
    for a in A {
        result.append(N - D[a][1])
    }
    return result
}
var A = [3, 1, 2, 3, 6]
let result = solution(&A)
print(result)
