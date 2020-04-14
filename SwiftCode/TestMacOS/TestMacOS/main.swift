//
//  main.swift
//  TestMacOS
//
//  Created by Cuongpro on 7/25/19.
//  Copyright © 2019 Enterprise. All rights reserved.
//

import Foundation

struct ScorePosition{
    var score: Int
    var position: Int
    var rank:Int
}
func createScorePosition(_ score: Int, _ position: Int)->ScorePosition{
    let scorePosition = ScorePosition(score: score, position: position, rank: -1)
    return scorePosition
}
// Complete the climbingLeaderboard function below.
func climbingLeaderboard(scores: [Int], alice: [Int]) -> [Int] {
    let n = scores.count
    let m = alice.count
    var aliceScorePosition:[ScorePosition] = []
    
    for i in 0..<m {
        let a = alice[i]
        aliceScorePosition.append(createScorePosition(a, i))
    }
    // sort alice
    aliceScorePosition = aliceScorePosition.sorted(by: {$0.score > $1.score})
    var i = 0
    var j = 0
    var rank = 1
    var prevScore = scores[0]
    while i < n {
        if scores[i] != prevScore {
            rank += 1
            prevScore = scores[i]
        }
        if scores[i] > aliceScorePosition[j].score {
            i += 1
        }else {
            aliceScorePosition[j].rank = rank
            j += 1
        }
        if j >= m {
            break
        }
    }
    while j < m {
        aliceScorePosition[j].rank = rank + 1
        j += 1
    }
    aliceScorePosition = aliceScorePosition.sorted(by: {$0.position < $1.position})
    var results:[Int] = []
    for a in aliceScorePosition {
        results.append(a.rank)
    }
    return results
}
//let s = [100, 100, 50, 40, 40, 20, 10]
let s = [50,50,50,50,50,50]
let a = [50,50,50,50,50,50]
var scores:[Int] = []
var alices:[Int] = []
let maxInt:UInt32 = 1000000000
for _ in 0..<2*100000 {
    scores.append(Int(arc4random_uniform(maxInt)))
    alices.append(Int(arc4random_uniform(maxInt)))
}

//let a = [2]
let result = climbingLeaderboard(scores: alices, alice: scores)
print(result)
print("--------------------------")

