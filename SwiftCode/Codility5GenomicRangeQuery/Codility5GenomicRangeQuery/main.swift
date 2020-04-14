//
//  main.swift
//  Codility5GenomicRangeQuery
//
//  Created by Cuongpro on 2/23/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation
struct Nuc {
    static let A:String = "A"
    static let C:String = "C"
    static let G:String = "G"
    static let T:String = "T"
    static let allValues = [Nuc.A, Nuc.C, Nuc.G, Nuc.T]
}
public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var result = [Int](repeatElement(0, count: P.count))
    var occurrences:[[String:Int]] = []
    var index = 0
    for char in S {
        var item: [String: Int]
        if index == 0 {
            item = [Nuc.A: 0, Nuc.C: 0, Nuc.G: 0, Nuc.T: 0]
        }else {
            item = occurrences[index - 1]
        }
        if char == Nuc.A.first {
            item[Nuc.A] = item[Nuc.A]! + 1
        }else if char == Nuc.C.first {
            item[Nuc.C] = item[Nuc.C]! + 1
        }else if char == Nuc.G.first {
            item[Nuc.G] = item[Nuc.G]! + 1
        }else if char == Nuc.T.first {
            item[Nuc.T] = item[Nuc.T]! + 1
        }
        occurrences.append(item)
        index += 1
    }
    for index in 0..<P.count {
        let startIndex = P[index]
        let endIndex = Q[index]
        var impactValue = 1
        for item in Nuc.allValues {
            var value = 0
            if startIndex > 0 {
                value = occurrences[startIndex - 1][item]!
            }
            let endValue = occurrences[endIndex][item]!
            if endValue - value > 0 {
                result[index] = impactValue
                break
            }
            impactValue += 1
        }
    }
    return result
}
var S = "CAGCCTA"
//var S = "AATTTTTTTTTTTT"
var P = [2, 5, 0, 0]
var Q = [4, 5, 6, S.count - 1]
let result = solution(&S, &P, &Q)
print(result)
