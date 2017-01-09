//: Playground - noun: a place where people can play

import UIKit

/***************************
Error Handling
 https://www.raywenderlich.com/130197/magical-error-handling-swift
***************************/

/*
enum IntParsingError: Error {
    case overflow
    case underflow
    case invalidInput(String)
}

extension Int {
    init(validating input: String) throws {
        // ...
//        if !_isValid(s) {
//            
//        }
        if Int(input)! > 100 {
            throw IntParsingError.invalidInput("You can not have more than 100")
        } else {
            throw IntParsingError.underflow
        }
        
        // ...
    }
}

do {
    let price = try Int(validating: "100")
} catch IntParsingError.invalidInput(let invalid) {
    print("Invalid character: '\(invalid)'")
} catch IntParsingError.overflow {
    print("Overflow error")
} catch IntParsingError.underflow {
    print("underflow error")
} catch {
    print("other error")
}
 */

/*
 https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105
 
 http://www.aidanf.net/learn-swift/arrays
 
 https://developer.apple.com/reference/swift
 
 https://developer.apple.com/reference/security/1654440-shared_web_credentials
 https://developer.apple.com/library/content/documentation/General/Conceptual/AppSearch/UniversalLinks.html
 https://www.raywenderlich.com/128948/universal-links-make-connection
 
 http://nshipster.com/swift-collection-protocols/
 
 /*
 Array maps and few advances.
 */
 https://www.objc.io/books/advanced-swift/preview/#arrays
 
 Generics
 https://www.raywenderlich.com/115960/swift-tutorial-introduction-to-generics
 
 */


/*
 https://appventure.me/2015/10/17/advanced-practical-enum-examples/
 
 */

// Arrays

/*
 1. Declarations
 2. initializations and array literals
 3. isEmpty
 4. Append and Additions and concatenate
 5. Assignments at index directly
 6. range assignments
 7. insert
 8. remove and removeatindex
 9. enumerate with and without tuple
 10. Count and repeat value (eg: var cells = [Bool](count: 64, repeatedValue: false))
 11.
 
 
 
 */



/***************************
 An ordered, random-access collection
****************************/

/*
// An array of 'Int' elements
let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15]

// An array of 'String' elements
let streets = ["Albemarle", "Brandywine", "Chesapeake"]


// empty array by specifying the Element type

// Shortened forms are preferred
var emptyDoubles: [Double] = []

// The full type name is also allowed
var emptyFloats: Array<Float> = Array()


// If you need an array that is preinitialized with a fixed number of default values,

var digitCounts = Array(repeating: 0, count: 10)
print(digitCounts)

//Accessing Array Values

for street in streets {
    print("I don't live on \(street).")
}

//Use the isEmpty property to check quickly whether an array has any elements, or use the count property to find the number of elements in the array.

if oddNumbers.isEmpty {
    print("I don't know any odd numbers.")
} else {
    print("I know \(oddNumbers.count) odd numbers.")
}


if let firstElement = oddNumbers.first, let lastElement = oddNumbers.last {
    //print(firstElement, lastElement, separator: ", ")
    print(firstElement, lastElement, separator: ",")
    print(firstElement, separator: "", terminator: "value")
}

*/

//print(oddNumbers[0], oddNumbers[3], separator: ", ")
//print(emptyDoubles[0] ?? "")

/**
 
 Adding and Removing
 
**/
/*
var students = ["Ben", "Ivy", "Jordell"]
//students.append("Maxime")
//
//students.append(contentsOf: ["Shakia", "William"])
//students.insert("Liam", at: 3)
//students.remove(at: 0)
//students.removeLast()


if let i = students.index(of: "Ivy") {
    students[i] = "newIvy"
    print(i)
}
print(students)

*/

/****
 Growing the Size of an Array
 ****/
//reserveCapacity(_:) 
/*
var arraySize = [Int]()  //[1, 2, 3, 4, 5]
arraySize.reserveCapacity(4)
arraySize = [1, 2, 3, 4]
print(arraySize)
arraySize.append(5)
arraySize.append(6)
print(arraySize)
*/

/****
 Modifying Copies of Arrays
 ****/

//Each array has an independent value that includes the values of all of its elements. For simple types such as integers and other structures, this means that when you change a value in one array, the value of that element does not change in any copies of the array

// 1

/*
var numbers = [1, 2, 3, 4, 5]
var numbersCopy = numbers
numbers[0] = 100
print(numbers)
print(numbersCopy)
*/

//If the elements in an array are instances of a class
//In this case, the values stored in the array are references to objects that live outside the array
//If you change a reference to an object in one array, only that array has a reference to the new object.
//However, if two arrays contain references to the same object, you can observe changes to that object’s properties from both arrays.


/****
 Example
****/

/*
// An integer type with reference semantics
class IntegerReference {
    var value = 10
}

var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers


/*

// Modifications to an instance are visible from either array
firstIntegers[0].value = 100

print(firstIntegers[0].value)
print(secondIntegers[0].value)

//secondIntegers[0].value = 200
//print(firstIntegers[0].value)
//print(secondIntegers[0].value)

// Replacements, additions, and removals are still visible
// only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
//print(secondIntegers[0].value)

*/


/***********
 Generic Initializer.
 ***********/


// syntax -> init(_:)
    //Creates an array containing the elements of a sequence.
// Declaration
    // init<S : Sequence where S.Iterator.Element == Element>(_ s: S)
// Parameters
    // s -> The sequence of elements to turn into an array.

/*
//1
let numbers = Array(1...7)
print(numbers)

//2

func cacheImagesWithNames(names: [String]) {
    // custom image loading and caching
}

let namedHues: [String: Int] = ["Vermillion": 18, "Magenta": 302,
                                "Gold": 50, "Cerise": 320]
let colorNames = Array(namedHues.keys)
cacheImagesWithNames(names: colorNames)

print(colorNames)
*/



// Array Literal

let ingredients = ["cocoa beans", "sugar", "cocoa butter", "salt"]



// capacity
/*
var numbers = [10, 20, 30, 40, 50]
print("Count: \(numbers.count), capacity: \(numbers.capacity)")
// Prints "Count: 5, capacity: 5"

//Before appending, the array allocates new storage that is large enough store the resulting elements.

//numbers.append(55)
//print("Count: \(numbers.count), capacity: \(numbers.capacity)")

numbers.append(contentsOf: stride(from: 60, through: 100, by: 10))
print("Count: \(numbers.count), capacity: \(numbers.capacity)")
*/


// End Index

let numbers = [10, 20, 30, 40, 50]
if let i = numbers.index(of: 30) {
    print(numbers[i ..< numbers.endIndex])
}


//If the array is empty, endIndex is equal to startIndex.


// First and last

let numbers = [10, 20, 30, 40, 50]
if let firstNumber = numbers.first {
    print(firstNumber)
}


// indices
//The indices that are valid for subscripting the collection, in ascending order.

/*
var c = Array([10, 20, 30, 40, 50])
var i = c.startIndex
while i != c.endIndex {
    c[i] /= 5
    print("before \(i)")
    i = c.index(after: i)
    print(i)
}
print(c)
// c == MyFancyCollection([2, 4, 6, 8, 10])
*/

/**********
 withUnsafeBufferPointer(_:)
 
 Calls a closure with a pointer to the array’s contiguous storage. If no such storage exists, it is first created.
 
 func withUnsafeBufferPointer<R>(_ body: (UnsafeBufferPointer<Element>) throws -> R) rethrows -> R
 
 ***********/

/*
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.withUnsafeBufferPointer { (buffer) -> Int in
    var result = 0
    for i in stride(from: buffer.startIndex, to: buffer.endIndex, by: 1) {
        print(result)
        result += buffer[i]
    }
    print(result)
    return result
}
 */

/*
let numbers = [1, 2, 3, 4, 5]
let sum = numbers.withUnsafeBufferPointer { (buffer) -> Int in
    var result = 0
    for i in stride(from: buffer.startIndex, to: buffer.endIndex, by: 1) {
        print(result)
        result += buffer[i]
    }
    print(result)
    return result
}

print(sum)

func getValues() -> Int {
    let numbers = [1, 2, 3, 4, 5]
    let sum = numbers.withUnsafeBufferPointer { (buffer) -> Int in
        var result = 0
        for i in stride(from: buffer.startIndex, to: buffer.endIndex, by: 1) {
            print(result)
            result += buffer[i]
        }
        print(result)
        return result
    }
    return sum
}
print(getValues())

*/



/***********
 withUnsafeMutableBufferPointer(_:)
 
 Calls the given closure with a pointer to the array’s mutable contiguous storage. If no such storage exists, it is first created
 
 ***********/

/*
var numbers = [1, 2, 3, 4, 5]
numbers.withUnsafeMutableBufferPointer { buffer in
    for i in stride(from: buffer.startIndex, to: buffer.endIndex - 1, by: 1) {
        swap(&buffer[i], &buffer[i + 1])
    }
}
print(numbers)



var numbers = [1, 2, 3, 4, 5]
func getValues() -> [Int] {
    numbers.withUnsafeMutableBufferPointer { buffer in
        for i in stride(from: buffer.startIndex, to: buffer.endIndex - 1, by: 1) {
            swap(&buffer[i], &buffer[i + 1])
        }
    }
    return numbers
}
let val = getValues()
print(val)
*/


/*********
 append(contentsOf:)
 
 Adds the elements of a collection to the end of the array
 
 Dec: mutating func append<C : Collection where C.Iterator.Element == Element>(contentsOf newElements: C)

 newElements => The elements to append to the array.
 ********/


//var numbers = [1, 2, 3, 4, 5]
//numbers.append(contentsOf: 10...15)
//print(numbers)

//var n1 = ["a", "b", "c"]
//var n2 = ["as", "bs", "cs"]
//n1.append(contentsOf: n2)
//print(n1)

/*****
 dropFirst()
 
 *****/
/*
let numbers = [1, 2, 3, 4, 5]
print(numbers.dropFirst())

let empty: [Int] = []
print(empty.dropFirst())
 
 // let numbers = [1, 2, 3, 4, 5]
 // print(numbers.dropFirst(2))
 //  Prints "[3, 4, 5]"
 // print(numbers.dropFirst(10))

 
 let numbers = [1, 2, 3, 4, 5]
 print(numbers.dropLast())

 let empty: [Int] = []
 print(empty.dropLast())
 
*/

/*******
 elementsEqual(_:)
 
 Returns a Boolean value indicating whether this sequence and another sequence contain the same elements in the same order.
 
 func elementsEqual<OtherSequence where OtherSequence : Sequence, OtherSequence.Iterator.Element == Element>(_ other: OtherSequence) -> Bool
 
 *******/


//let a = 1...3
//let b = 1...10
//print(a)
//
//print(a.elementsEqual(b))
//print(a.elementsEqual([1, 2, 3]))
//
//let n1 = Array(1...9)
//let n2 = Array(1...15)
//print(n1.elementsEqual(n2))
//print(n1.elementsEqual(Array(1...9)))
//
//let c1 = Array(arrayLiteral: "asdf", "bsdf", "cassa", "drwsf")
//let c2 = Array(arrayLiteral: "rasdf", "rbsdf", "wcassa", "fdrwsf")
////print(c1.elementsEqual(c2))
////print(c1.elementsEqual(Array(arrayLiteral: "asdf", "bsdf", "cassa")))
//
//print(c1.elementsEqual(Array(arrayLiteral: "asdf", "bsdf", "cassa"), by: { (a1, b1) -> Bool in
//    if a1 == b1 {
//        print("true")
//        return true
//    }
//    print("false")
//    return false
//}))

/******
 filter(_:)
 ******/
/*
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
//let shortNames = cast.filter { $0.characters.count < 5 }
//let shortNames  = cast.filter { (key) -> Bool in
//    return key == "Kim"
//}
let shortNames = cast.filter { $0 == "Kim" }
print(shortNames)

//let filteredArray = arrayOfUsers.filter() { $0.userID == "1" }
//var filteredArray = arrayOfUsers.filter( { (user: UserDetails) -> Bool in
//    return user.userID == "1"
//})
 
 let sortedNumbers = numbers.sort { (firstObject, secondObject) in
 return firstObject > secondObject
 }
*/


/*****
 first(where:)
 
 func first(where predicate: (Element) throws -> Bool) rethrows -> Element? 
 
 Returns the first element of the sequence that satisfies the given predicate or nil if no such element is found.
 *****/
/*
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let val = cast.first { (key) -> Bool in
    return key == "Vivien"
}
print(val!)
let val1 = cast.first(where: { $0 == "Marlon" })
print(val1!)
*/


/******
 flatMap(_:)
 
 Returns an array containing the non-nil results of calling the given transformation with each element of this sequence.
 
 Use this method to receive an array of nonoptional values when your transformation produces an optional value.
 ******/

//////// 1
let values = [2.0,4.0,5.0,7.0]
//var squares: [Double] = []
//for value in values {
//    squares.append(value*value)
//}



let squares2 = values.map({ (value: Double) -> Double in
    return value * value
})

let squares2 = values.map {value in value * value}
let squares = values.map {$0 * $0}

 2
let milesToPoint = ["point1":120.0,"point2":50.0,"point3":70.0]
let kmToPoint = milesToPoint.map { name,miles in miles * 1.6093 }
print(kmToPoint)
let km = milesToPoint.map { $0.value * 1.6093 }
print(km)

/ example
let numbers = ["1", "2", "three", "/4/", "5"]
let mapped: [Int?] = numbers.map { str in Int(str) }
print(mapped)
//
//let flatMapped: [Int] = numbers.flatMap { str in Int(str) }
//print(flatMapped)



/******
 foreach
 
 ******/

//let numberWords = ["one", "two", "three"]
//for word in numberWords {
//    print(word)
//}
//numberWords.forEach { word in
//    print(word)
//}


//joined(separator:)

//let cast = ["Vivien", "Marlon", "Kim", "Karl"]
//let list = cast.joined(separator: ", ")
//print(list)
//
//let nestedNumbers = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
//let joined = nestedNumbers.joined(separator: [-1, -2])
//print(Array(joined))


/*
 MAP
 */
/*
let cast = ["Vivien", "Marlon", "Kim", "Karl"]
let lowercaseNames = cast.map { $0.lowercased() }
// 'lowercaseNames' == ["vivien", "marlon", "kim", "karl"]
let letterCounts = cast.map { $0.characters.count }


var students = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
students.sort()
print(students)
students.sort(by: >)
print(students)

let students1: Set = ["Kofi", "Abena", "Peter", "Kweku", "Akosua"]
let sortedStudents = students.sorted()
print(sortedStudents)

let descendingStudents = students1.sorted(by: >)
print(descendingStudents)
*/

/*****
 Spilts
 *****/

/*
let line = "BLANCHE:   I don't want realism. I want magic!"
print(line.characters.split(separator: " ")
    .map(String.init))
print(line.characters.split(separator: " ", maxSplits: 1)
    .map(String.init))
print(line.characters.split(separator: " ", omittingEmptySubsequences: false)
    .map(String.init))
*/

/****
 contains(where:)
 ****/
/*
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
 
 */
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

/*
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


let a: [[String: Int]] = [["a": 1, "b": 2], ["c": 3], ["d": 4]]
print(a.contains(where: { $0.values.contains(5) }))



*/

/***
 reduce(_:_:)
 
 Returns the result of calling the given combining closure with each element of this sequence and an accumulating value.
 
 func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
 ***/

//let numbers = [1, 2, 3, 4]
////let addTwo: (Int, Int) -> Int = { x, y in x + y }
////print(addTwo)
////let numberSum = numbers.reduce(0, addTwo)
//let n = numbers.reduce(0, {x, y in x + y })
//print(n)


let numbers = Array(1...9)
var val = 0
for i in stride(from: 0, to: 8, by: 2) {
    print(i)
    val += 1
}
print(val)

for i in stride(from: 7, through: 12, by: 1) {
    print(i)
}

















*/
