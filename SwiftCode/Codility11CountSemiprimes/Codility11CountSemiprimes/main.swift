//
//  main.swift
//  Codility11CountSemiprimes
//
//  Created by Cuongpro on 2/29/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation

public func solution(_ N : Int, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    var bPrimes:[Bool] = [Bool](repeatElement(true, count: N + 1))
    var start = 2
    bPrimes[0] = false
    bPrimes[1] = false
    while start * start <= N {
        var current = start
        while current * start <= N {
            bPrimes[current * start] = false
            current += 1
        }
        start += 1
    }
    var iPrimes:[Int] = []
    for i in 0...N {
        if bPrimes[i] {
            iPrimes.append(i)
        }
    }
    print(iPrimes)
    var bSemiprimes:[Bool] = [Bool](repeatElement(false, count: N + 1))
    start = 0
    let m = iPrimes.count
    for start in 0..<m{
        var next = start
        while iPrimes[start] * iPrimes[next] <= N{
            bSemiprimes[iPrimes[start] * iPrimes[next]] = true
            next += 1
        }
    }
    print(bSemiprimes)
    var semiprimes:[Int] = [Int](repeatElement(0, count: N + 1))
    var count = 0
    for i in 0..<bSemiprimes.count {
        if bSemiprimes[i] {
            count += 1
        }
        semiprimes[i] = count
    }
    var result:[Int] = []
    print(semiprimes)
    for i in 0..<P.count {
        var k = semiprimes[Q[i]] - semiprimes[P[i]]
        if P[i] > 0, semiprimes[P[i]] > semiprimes[P[i] - 1] {
            k += 1
        }
        result.append(k)
    }
    return result
}
let N = 26
var P = [1, 4, 16]
var Q = [26, 10, 20]
let r = solution(N, &P, &Q)
print(r)
