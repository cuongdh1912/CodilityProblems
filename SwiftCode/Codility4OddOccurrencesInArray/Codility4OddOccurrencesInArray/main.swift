//
//  main.swift
//  Codility4OddOccurrencesInArray
//
//  Created by Cuongpro on 2/24/20.
//  Copyright © 2020 Enterprise. All rights reserved.
//

import Foundation
/*public func solution(_ A : inout [Int]) -> Int{
    var binaryArray:[Int16] = []
    for a in A {
        let currentBinary = decimalToBinary(int: a)
        var index = 0
        for i in currentBinary {
            if binaryArray.count <= index {
                binaryArray.append(i)
            }else{
                binaryArray[index] = binaryArray[index] ^ i
            }
            index += 1
        }
    }
    print(Int.max)
    while binaryArray[binaryArray.endIndex - 1] == 0 {
        binaryArray.removeLast()
    }
//    binaryArray = binaryArray.reversed()
//    let s = binaryArray.map{x -> String in
//        return String(x)
//    }
//    let result = s.joined()
//    return Int(result, radix: 2)!//
    return binaryToDecimal(binary: binaryArray)
}
func decimalToBinary(int: Int) -> [Int16] {
    var binary:[Int16] = []
    let string = String(int, radix: 2)
    for s in string {
        if let i = Int16(String(s)) {
            binary.insert(i, at: 0)
        }
    }
//    var i = int
//    while i > 0 {
//        let m = Int16(i % 2)
//        binary.append(m)
//        i = i / 2
//    }
    return binary
}
func binaryToDecimal(binary: [Int16]) -> Int{
    var result = 0
    var multiple = 1
    for b in binary {
        result = result + Int(b) * multiple
        multiple *= 2
    }
    return result
}
 */
public func solution(_ A : inout [Int]) -> Int{
    var result = 0
    for a in A {
        result = result ^ a
    }
    return result
}
//var A = [9, 3, 9, 3, 9, 7, 9]
//let a = solution(&A)


/* find small number that has not "11" in binary
func d2b(_ d: Int) -> [Int16]{
    let string = String(d, radix: 2)
    return string.map {x -> Int16 in
        return Int16(String(x))!
    }
}
public func solution2(_ A : inout Int) -> Int{
    let binary = d2b(A)
    var remain = 0
    var b = [Int16](binary.reversed())
    var index = 0
    var endChange = 0
    while index < b.count - 1 {
        if remain == 1 {
            remain = 0
            if b[index] == 0 {
                b[index] = 1
                continue
            }else {
                b[index] = 0
                index += 1
                continue
            }
        }else {
            if b[index] == 1, b[index + 1] == 1 {
                b[index + 1] = 0
                b[index] = b[index + 1]
                remain = 1
                index += 2
                endChange = index
            }else {
                index += 1
            }
        }
    }
    if remain > 0 {
        b.append(1)
    }
    for i in 0..<endChange {
        b[i] = 0
    }
    b = String(b.reversed())
    let string = b.map{x -> String in
        return String(x)
    }
    let s = string.joined()
    let result = Int(s, radix:2)
    return result ?? A
}
 */
func d2b(_ d: Int) -> [Int16]{
    let string = String(d, radix: 2)
    return string.map {x -> Int16 in
        return Int16(String(x))!
    }
}
public func solution2(_ A : inout Int) -> Int{
    var string = String(A, radix: 2)
    string = String(string.reversed())
    var binary = string.map{x -> String in
        return String(x)
    }
    var remain = 0
    var index = 0
    var endChange = 0
    while index < binary.count - 1 {
        if remain == 1 {
            remain = 0
            if binary[index] == "0" {
                binary[index] = "1"
                continue
            }else {
                binary[index] = "0"
                index += 1
                continue
            }
        }else {
            if binary[index] == "1", binary[index + 1] == "1" {
                binary[index + 1] = "0"
                binary[index] = binary[index + 1]
                remain = 1
                index += 2
                endChange = index
            }else {
                index += 1
            }
        }
    }
    if remain > 0 {
        binary.append("1")
    }
    for i in 0..<endChange {
        binary[i] = "0"
    }
    string = binary.joined()
    string = String(string.reversed())
    let result = Int(string, radix:2)
    return result ?? A
}
var a = 164
let result = solution2(&a)
print(result)
var k = 3
let closure = {x,y ->Int in
    return k + x * y
}
var array:[(_ x: Int, _ y:Int)->Int] = []
func callClosure(a: Int, c: @escaping(_ x: Int,_ y: Int)-> Int ){
    let b = a + c(a,a)
    array.append(c)
    print(b)
}
callClosure(a: 2, c: closure)
callClosure(a: 3, c: {x, y -> Int in
    return x * 2 + y
})
let d = array.first?(4, 5)
print(d)


// ================Closure=================
var customersInLine = ["Ewa", "Barry", "Daniella"]
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
var c = {()->String in
    return "abcde"
}
serve(customer: c)
// Prints "Now serving Ewa!"
customersInLine = ["Alex", "Ewa", "Barry", "Daniella"]
var arr:[()->String] = []
func serve2(customer customerProvider: @autoclosure @escaping () -> String) {
//    let a = customerProvider()
//    print("2 Now serving \(a)!")
    arr.append(customerProvider)
}
let closure2 = {x ->Int in
    return k + x
}
let c2: (_ x: Int) -> String = {x ->String in
    return String(x)
}

serve2(customer: c2(4))
let l = arr.first?()
print(l!)
open class AB{
    let x:Int = 3
}
open class D:AB{
    func c(){
        let a = x + x
    }
}
func serve3(customer customerProvider: (_ x: String) -> String) {
    print("3 Now serving \(customerProvider("ab"))!")
}
let closure3 = {x -> String in
    return x + x
}
serve3(customer: closure3)


// ================Error Handling=================
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0
    
    func vend(itemNamed name: String) throws -> String{
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }
        
        coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
        return "1122"
    }
}

let v = VendingMachine()
let s1 = try? v.vend(itemNamed: "Pretzels")
print(s1)
do {
    let s2 = try v.vend(itemNamed: "Chips")
    print(s2)
}catch{
    print("defkg")
}
