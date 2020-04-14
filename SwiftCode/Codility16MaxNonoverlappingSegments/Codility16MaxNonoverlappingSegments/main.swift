//
//  main.swift
//  Codility16MaxNonoverlappingSegments
//
//  Created by Cuongpro on 3/1/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    func checkOverlapping(i: Int, j: Int) -> Bool{
        return (A[i] >= A[j] && A[i] <= B[j]) || (A[j] >= A[i] && A[j] <= B[i])
    }
    let N = A.count
    var prevMaximum:[Int] = [Int](repeatElement(1, count: N))
    if N == 0 {
        return 0
    }
    var index = 1
    while index < N {
        var begin = 0
        var end = index - 1
        var binarySearch = -1
        while begin <= end {
            let mid = Int((begin + end)/2)
            if checkOverlapping(i: index, j: mid) {
                end = mid - 1
            }else {
                begin = mid + 1
                binarySearch = mid
            }
        }
        if binarySearch >= 0 {
            prevMaximum[index] = max(prevMaximum[binarySearch] + 1, prevMaximum[index-1])
        }else {
            prevMaximum[index] = prevMaximum[index-1]
        }
        index += 1
    }
    return prevMaximum.max()!
}

var A:[Int] = [1, 3, 3, 3, 8, 8, 9, 7, 10, 7,1, 11]
var B:[Int] = [2, 6, 6, 6, 8, 8, 9, 9, 10, 10,10, 12]
let result = solution(&A, &B)
print(result)
func swap<TinhDonPhuong: Equatable, DoiKhiThayEmBuon>(a: TinhDonPhuong, b: DoiKhiThayEmBuon){
    
}
protocol P {
    associatedtype Item
    func append(item: Item)
}
class D:P{
    typealias Item = Int
    func append(item: Int) {
        
    }
}
enum En{
    struct A {
        enum d {
            case e
        }
    }
    enum C {
        case d
    }
}
