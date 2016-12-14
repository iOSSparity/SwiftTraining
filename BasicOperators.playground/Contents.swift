//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//************************************Operators*********************************
//1.Unary (Prefix and PostFix)

var isiOSAwesome = false;
!isiOSAwesome


//2.Binary

var x = 10
var y = 20

var sum = x + y


//3.Ternary (Condition) ? b: C

//Condition is true b is executed else c

var minAmountForDiscount  = 3000
var totalAmount = 3500
var discount = 100
totalAmount = totalAmount > minAmountForDiscount ? (totalAmount - discount) : totalAmount



//***********************************Assignment Operator************************
//Tuple
//var a = 10
let (firstValue,secondValue) = (3,4)
let error = (404,"Not found")
error.0
error.1

x
y


//***********************************Arithmetic Operators************************

3 + 5
4 - 2
5 * 2
8 / 3

var trainingSubject  = "Swift"
var welcomeMsg = "Hi Welcome to " + trainingSubject + " Training"


//***********************************Remainder Operator************************

10 % 3


//****************************Compound Assignment Operator************************

var a = 10
a += 20
a = a + 20
a -= 20

//var p = a -= 30

//****************************Comparison Operator************************

2 == 2
2 != 3
3 > 4
4 > 3
3 >= 4
4 <= 5

("Spple",2) < ("Samsung",2)
(2, "Samsung") < (2, "Apple")
(1,"Momdfdfdf") < (2,"Dad")
(2, "Samsung","Samsung") < (2, "Samsung","Motorola")
(2, "Apple",4) ==  (2, "Apple",5)

"ant" > "elephant"
"insect" > "elephant"

//****************************Nil-Coalescing Operator***********************

//a != nil ? a! : b

//a??b
let defaultColorName = "red"
var userDefinedColorName : String?
var colorNameToUse = userDefinedColorName ?? defaultColorName
userDefinedColorName = "Green"
colorNameToUse = userDefinedColorName ?? defaultColorName


let defaultNumber = 10
var userNumber : Int?
//print(userNumber)
let temp : NSInteger  ;
//print(temp)

//****************************Range Operators***********************


//Closed Range Operator

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

//Half-Open Range Operator

for index in 1..<5 {
    print("\(index) times 5 is \(index * 5)")
}


//****************************Logical Operators***********************


//1.Logical NOT (!a)

let isKeyAvailable = false

if !isKeyAvailable {
    
    print("Access I granrted")
    
}

//2.Logical AND (a && b)

let isBiometricAuthenticated = true


if  !isKeyAvailable && isBiometricAuthenticated {
    
    print("Access Granted Fully")
    
    
}


//3.Logical OR (a || b)



if isKeyAvailable || isBiometricAuthenticated {
    
    print("Allow")
    
}

//****************************Bitwise Operators***********************

//1.Bitwise NOT

let initialBits: UInt8 = 0b00001111
let invertedBits = ~initialBits

let bitWiseNot =  UIImage(named: "bitwisenot")

//2.Bitwise AND

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits

let bitWiseAnd =  UIImage(named: "bitwiseand")

//3.Bitwise OR 

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits

let bitWiseOr =  UIImage(named: "bitwiseor")
//4.Bitwise XOR

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits

let bitWiseXor =  UIImage(named: "bitwisexor")



//****************************Operator Overloading***********************
func * (left: String, right: Int) -> String {
    if right <= 0 {
        return ""
    }
    
    var result = left
    for _ in 1..<right {
        result += left
    }
    
    return result
}

2  * 6
"2" * 6

//****************************Strings and Characters***********************

//String Literals

let helloMsg = "Hi, welcome to Swift Training Session"
var helloString : String?
//print(helloString)
helloString = "Hi"




//String Initializers


let emptyString = "" // Literal Syntax
var anotherEmptyString = String()  // initializer syntax


//String Mutability and String Interpolation

let constantMessage = "Hello,"
var msg  = constantMessage + "World"
msg += "World"
let iOSTeamStrength = 9
msg = "iOS Team Size is \(iOSTeamStrength)"

//Empty Check
if emptyString.isEmpty {

print("String is Empty")


}

//String are Value Types

var objectiveC = "ObjectiveC"
var swift = objectiveC
swift = "Swift"

print(swift)
print(objectiveC)


//Print Characters in String
for char in objectiveC.characters {

print(char)
}

//Append Character to String
objectiveC.append("!")

objectiveC[objectiveC.startIndex]
//print(objectiveC.startIndex)
objectiveC[objectiveC.index(after: objectiveC.startIndex)]
objectiveC[objectiveC.index(before: objectiveC.endIndex)]
objectiveC.insert("-", at: objectiveC.index(objectiveC.endIndex, offsetBy: -2 ))

let range  = objectiveC.index(objectiveC.endIndex, offsetBy: -3)..<objectiveC.endIndex
objectiveC.removeSubrange(range)

//Find character index


//objectiveC[objectiveC.endIndex]


//String Comparison
swift == objectiveC ? "Equal" : "Not equal"
swift == "Swift" ? "Equal" : "Not equal"

var string1 = "Steve Jobs"
var string2 = "Tim Cook"

if string1.hasPrefix("Steve") {

    print("Steve")

}


if string2.hasSuffix("Cook") {
    
    print("Cook")
    
}

let dogString = "Dog‼🐶"

for character in dogString.characters {

    print(character)
}














































































































