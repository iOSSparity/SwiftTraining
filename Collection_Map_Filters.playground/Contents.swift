//: Playground - noun: a place where people can play

import UIKit

// https://www.objc.io/books/advanced-swift/preview/

let fibs = [ 1, 1, 2, 3, 5]

//Transforming Arrays
// Map


var squared: [Int] = []
for fib in fibs {
    squared.append(fib * fib)
}
squared

///using map:

let squares = fibs.map { fib in fib * fib }
let sq = fibs.map { $0 + $0 }

print(sq)
squares









// array.index(of: "foo") is clearer than array.index { $0 == "foo" }

//  you can sort an array of people by their ages (people.sort { $0.age < $1.age }) or check if the array contains anyone underage (people.contains { $0.age < 18 })


//////where you search an array in reverse order for the first element that matches a certain condition

let names = ["Paula", "Elena", "Zoe"]

var lastNameEndingInA: String?
for name in names.reversed() where name.hasPrefix("P") {
    lastNameEndingInA = name
    break
}
lastNameEndingInA


///consider writing a short extension to Sequence. The method last(where:) wraps this logic

//
//extension Sequence {
//    func checkForSuffix(where predicate: (Iterator.Element) -> Bool) -> Iterator.Element? {
//        for element in reversed() where predicate(element) {
//            return element
//        }
//        return nil
//    }
//}
//let match = names.checkForSuffix { $0.hasSuffix("a") }
//match



//guard let match = someSequence.checkForSuffix(where: { $0.passesTest() })
//    else {
//        return
//}



//let cast = ["Vivien", "Marlon", "Kim", "Karl"]
//let shortNames = cast.filter { $0.characters.count < 5 }
//let shortNames1  = cast.filter { (key) -> Bool in
//    return key == "Kim"
//}
//let shortNames2 = cast.filter { $0 == "Kim" }
//print(shortNames1)
//print(shortNames2)


//let filteredArray = arrayOfUsers.filter() { $0.userID == "1" }
//var filteredArray = arrayOfUsers.filter( { (user: UserDetails) -> Bool in
//    return user.userID == "1"
//})

//let sortedNumbers = numbers.sort { (firstObject, secondObject) in
//    return firstObject > secondObject
//}

//print((1..<10).filter { num in num % 2 == 0 })
//print((1..<10).filter { $0 % 2 == 0 })
//print((1..<10).map { $0 * $0 }.filter { $0 % 2 == 0 })
//
//extension Array {
//    func filter(_ isIncluded: (Element) -> Bool) -> [Element] {
//        var result: [Element] = []
//        for x in self where isIncluded(x) {
//            result.append(x)
//        }
//        return result
//    }
//}




//
// if you ever find yourself writing something like the following, stop!
//  bigArray.filter { someCondition }.count > 0
// bigArray.contains { someCondition }


let nums = Array(1...10)
extension Sequence {
    public func all(matching predicate: (Iterator.Element) -> Bool) -> Bool {
        // Every element matches a predicate if no element doesn't match it:
        return !contains { !predicate($0) }
    }
}

let evenNums = nums.filter { $0 % 2 == 0 }
print(evenNums)
print(evenNums.all { $0 % 2 == 0 })


//  Reduce

/**
 Both map and filter take an array and produce a new, modified array. Sometimes, however, you want to combine all elements into a new value. For example, to sum up all the elements, we could write the following code
 **/

var total = 10
for num in fibs {
    total = total * num
}
total



// The reduce method takes this pattern and abstracts two parts: the initial value (in this case, zero), and the function for combining the intermediate value (total) and the element (num)


let sum = fibs.reduce(0) { total, num in total + num }
print(sum)
print(fibs.reduce(10, *))
print(fibs.reduce("") { str, num in str + "\(num) " })

let stringA = ["a", "b", "c"]
print(stringA.reduce("", +))


extension Array {
    func reduce<Result>(_ initialResult: Result,
                _ nextPartialResult: (Result, Element) -> Result) -> Result
    {
        var result = initialResult
        for x in self {
            result = nextPartialResult(result, x)
        }
        return result
    }
}




//   Another performance tip: reduce is very flexible, and it’s common to see it used to build arrays and perform other operations. For example, you can implement map and filter using only reduce:
/*
extension Array {
    func map2<T>(_ transform: (Element) -> T) -> [T] {
        return reduce([]) {
            $0 + [transform($1)]
        }
    }
    
    func filter2(_ isIncluded: (Element) -> Bool) -> [Element] {
        return reduce([]) {
            isIncluded($1) ? $0 + [$1] : $0
        }
    }
}
*/

// A Flattening Map

// Sometimes, you want to map an array where the transformation function returns another array and not a single element.
/*
let ranks = ["J","Q","K","A"]
let suits = Array(arrayLiteral: "a", "b", "c", "d")
let result = suits.flatMap { suit in
    ranks.map { rank in
        (suit, rank)
    }
}
print(result)
*/


for element in [1,2,3] {
    print(element)
}

[1,2,3].forEach { element in
    print(element)
}




// Array slice

let slice = fibs[1..<fibs.endIndex]
slice
type(of: slice)
print(Array(fibs[1..<fibs.endIndex]))
print(ArraySlice(fibs[2..<fibs.endIndex]))






enum HTTPResponse {
    case ok
    case error(Int)
}

let lastThreeResponses: [HTTPResponse] = [.ok, .ok, .error(404)]
let hadError = lastThreeResponses.contains { element in
    if case .error = element {
        return true
    } else {
        return false
    }
}

print(hadError)

let expenses = [21.37, 55.21, 9.32, 10.18, 388.77, 11.41]
let hasBigPurchase = expenses.contains { $0 > 100 }

let dict = ["a" : "1", "b": "san"]
let arr = [["a" : "1", "b": "sandy"], ["a" : "12", "b": "sand"]]


//let check = arr.contains { (dict) -> Bool in
//    let cond = dict.map({ (key, value) -> Bool in
//        if key == "b" && value == "san" {
//            return true
//        }else if key == "a" && value == "1" {
//            return true
//        }
//        return false
//    })
//    return cond.last!
//}
//print(check)


class MyModal {
    var name: String
    var title: String
    
    init(name: String, title: String) {
        self.name = name
        self.title = title
    }
    
}

 var dictRamesh = MyModal(name: "Ramesh", title: "ABC")
 var arrayOfStudents = [ MyModal(name: "Ramesh", title: "ABC"), MyModal(name: "Suresh", title: "DEF") ]
 let ramesh = arrayOfStudents.contains(where: {$0.name == "Ramesh" })
 print(ramesh)
 
 
 let a: [[String: Int]] = [["a": 1, "b": 2], ["c": 2], ["d": 1]]
 print(a.contains(where: { $0.values.contains(5) }))
print(a.contains(where: { $0.values.contains(3) }))
 
 




