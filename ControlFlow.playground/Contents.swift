//: Playground - noun: a place where people can play

import UIKit

/*
 Control Flow Statements:
 
 1.Execute Task multiple Times - while,repeat-while(do-while)
 2.Execute different branches of Code based on Conditions- if,guard and switch
 3.Transfer Flow of execution - break,continue, fallthrough , return,throw
 4.for-in Loop  */

//1.While
var initalValue = 1

while(initalValue<10){
    initalValue += 1
    print(initalValue)
    
}

//repeat-while
repeat {
    initalValue += 1
    print(initalValue)
    
} while initalValue < 20

//2

let appleDevices = ["Mac","iPod","iPhone","iPad","iWatch"]
for device in appleDevices {
    print(device)
}

let appleOS = ["Mac":"Sierra","iPhone":"iOS","iWatch":"Watch OS"]

for (device,os) in appleOS{
    
    print("\(device)-------\(os)")
    
}

var startIndex = 1
let endIndex = 20
for _ in 1...endIndex {
    print(startIndex)
    startIndex += 1
}


for index in Array(1...20).reversed(){
    
    print(index)
    
}
//IF

let version = 7.0

if version < 8.0{
    print("Playgrounds are not supported in Xcode")
    
}else{
    
    print("Playgrounds are supported in Xcode")
    
    
    
}

//stride is a function from the swift standard library that returns the sequence of values start, start + stride,start + 2 * stride, … end) where last is the last value in the progression that is less than end.

for i in stride(from: 1, to: 3, by: 0.4)  {
    print(i)
}



//Switch
//Interval Matching
//Combine Different Cases
//where
var age = 60

switch age {
    
case 71...120:
    print("Drink whatever you want if you are alive")
    fallthrough
case 46...70:
    print("Juice")
    fallthrough
case 26...45:
    print("Wine")
    break
case 15..<18:
    print("Tea, Coffe")
    fallthrough
case 5...14:
    print("Boost,Complan")
    fallthrough
//case let x where (x > 1 && x <= 4) :
case 2...4:
    print("Water")
    fallthrough
case 0,1:
    print("Milk")
    fallthrough
default:
    print("Water")
}

let name = ("Rajesh","Venu")

switch (name) {
case ("Venu","Rajesh"):
    print("Rajesh")
default:
    print("Others")
}

//Tuples Switch

let somePoint = (1, 2)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}


//Continue

let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]
for character in puzzleInput.characters {
    if charactersToRemove.contains(character) {
        continue
    } else {
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

//Break use same switch example
//Fallthrough use same switch example

//Guard
//Unlike if guard Contains else statement always
//Code Readability
var myUsername: String?
var myPassword: String?

// Hideous Code
//Pyramid of Doom
//func userLogIn() {
//    if let username = myUsername {
//        if myPassword != nil {
//            print("Welcome, \(username)")
//        }
//    }else{
//    print("Please enter usename and Password")
//
//    }
//}


func userLogIn() {
    guard let username = myUsername, let _ = myPassword else {
        print("Enter Username and password")
        return
    }
    print("Welcome, \(username)!") }
//
myUsername = "Rajesh"
myPassword = "Rajesh"

userLogIn()

var studentsInfo:[String:Int]?
//Print all Students

func printData(){

guard studentsInfo != nil  else {
    print("No Students Data")
    return
}
//
//print( (studentsInfo)!)

for (name,marks) in studentsInfo! {
    
    switch marks {
    case 0...34:
        print("FAIL....\(name)")
        
    case 35...60:
        print("I CLASS....\(name)")
        
    case 61...80:
        print("II....\(name)")
        
    case 81...99:
        print("DISTINCTION....\(name)")
        
    case 100:
        print("TOPPER....\(name)")
        
    default:
        
        print("DEFAULT")
    }
}
    
    
}

studentsInfo = ["Suresh":90,"Ramesh":28,"Mahesh":35,"Naresh":28,"Samantha":89,"Kajal":95,"Rakul":100]

printData()

//Print only Passed Students

var passedArray = [String]()
for (name,marks) in studentsInfo! {
    
    if(marks<35) {
        continue
    }
    else {
        passedArray.append(name)
        
    }
    
}


print(passedArray)








