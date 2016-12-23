//: Playground - noun: a place where people can play

import UIKit

/*
 1.What is a function - Define,Calling
 2.Functions Parameters and Return Values
 -Function Without Parameters
 -Functions with multiple Parameters
 -Functions Without Return Values
 -Functions with multiple return Values
 3.Optional Tuple return types
 4.Function Argument Labels and Parameter Names
 -Specifying Argument Labels
 -Omitting Argument Values
 5.Default Parameter Values
 6.Vardiac Parameters
 7.in-out parameters
 8.Function Types
 9.Using Function Types
 -Function Types as Parameter Types
 10.Nested Functions
 */

/*
 1.Function
 Self Contained block of Code that performs some task
 Syntax
 func name(list of parameters) -> return type {
 statements
 }
 
 1.Functions can be assigned to variables and passed in and out of other functions as arguments, just as an Int or a String can be.
 2.Functions can “capture” variables that exist outside of their local scope.
 3.There are two ways of creating functions: with the func keyword, or with { }. Swift calls the latter “closure expressions”.
 
 
 
 */

//Empty Function
func welcomeMessage(){
    
    print("Welcome to Swift Training")
}


welcomeMessage()

//2.Function with Input
func welcomeMember(member:String){
    
    print("Hi \(member), welcome to iOS Training")
    
    
}

welcomeMember(member: "Steve Jobs")

//Function with Input and Return Values
//No Arguments only Parameters --
func addOperation(parameter1:Int,parameter2:Int)->Int{
    
    return parameter1+parameter2
    
}

//By default, parameters use their parameter name as their argument label.
print(addOperation(parameter1: 10, parameter2: 20))

//One Parameter and one Argument Label
func subOperation(operand1:Int,with operand2:Int)->Int{
    
    return operand1-operand2
    
}
subOperation(operand1: 30, with: 10)

//Parametrs + Argument Labels
func multiply(operand1 x:Int,operand2 y:Int)->Int{
    
    return x*y
    
}


print(multiply(operand1: 5, operand2:10 ))

//Omitting Arguments
func divideOperation(_ operand1:Int,with operand2:Int)->Int{
    
    return operand1/operand2
    
}
print(divideOperation(30, with: 3))


//Function with Input and Output PArametrs

func getSumAndAverage(array:[Int])->(Int,Int){
    
    
    return (array.reduce(0, +),(array.reduce(0, +)/array.count))
    
}

print(getSumAndAverage(array: [10,20,30,4]))

//3.optional Return types [String]?

let totalItems = ["Veg-Manchuria","Mutton-Biryani","Fried-Rice","Palak-Paneer","Chicken65","Rasamalai","Apollo-Fish"]
let vegItems = ["Veg-Manchuria","Fried-Rice","Palak-Paneer","Rasamalai"]


func getItemsAvailabe(isVegetarian:Bool )->[String]?{
    
    return isVegetarian ? nil :totalItems
    
}

print(getItemsAvailabe(isVegetarian: false) ?? "No items Available")


//3.optional Return types [String?]
func getNonVegItemsAvailable()->[String?]{
    var nonVegItemsArray = [String?]()
    for item in totalItems{
        vegItems.contains(item) ?  nonVegItemsArray.append(nil) : nonVegItemsArray.append(item)
        
    }
    return nonVegItemsArray
}
let nonVegItems = getNonVegItemsAvailable()

for nonVegItem in nonVegItems{
    
    print(nonVegItem ?? "")
    
}

//Default Parameter Values

//You can define a default value for any parameter in a function by assigning a value to the parameter after that parameter’s type. If a default value is defined, you can omit that parameter when calling the function.


func hello(name: String = "you") {
    print("hello, \(name)")
}

hello(name: "Rajesh")
// hello, Mr. Roboto

hello()
// hello, you



//Variadic Parameters

func letsGoThePartyGuys(names: String...) {
    
    print("\(names.joined(separator: ",")) are goingtoParty")
}


letsGoThePartyGuys(names: "Rajesh","Venu","Chaitu","Sandeep")

//7.in-out parameters
//In-out parameters are an alternative way for a function to have an effect outside of the scope of its function body.

func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")


//8. Function Types

let operationtype : (Int,Int) -> Int
operationtype = addOperation
print(operationtype(10, 10))


//Function Types as Parameter Types

var operatorType = "*"


func getAppropriatefunction(operationType:String) ->  (Int,Int)-> Int {
    
    switch(operationType){
    case "+":
        return  addOperation
    case "-":
        return  subOperation
    case "*":
        return  multiply
    case "/":
        return  divideOperation
    default:
        return addOperation
    }
    
}

func performOperation(operatorType: String, on x: Int , and y:Int ){
    
    
    let function =    getAppropriatefunction(operationType: operatorType)
    printValue(function: function, x: x, y: y)
    
}


func printValue(function: (Int,Int)->Int , x: Int,y:Int){
    
    
    print(function(x,y))
    
}

performOperation(operatorType: "/", on: 12, and: 10)

//Nested Functions


func bookTicket(for gender:String) -> (String)->() {
    
    func getLadiesSeatLayout(passengerName: String ){
        
        print("Booking seat for \(passengerName) in Girls Layout")
    }
    
    
    func getGentsSeatLayout(passengerName: String){
        print("Booking seat for \(passengerName) in Boys Layout ")
        
    }
    
    return gender == "M" ? getGentsSeatLayout : getLadiesSeatLayout
    
}



let layoutType :(String)->()   = bookTicket(for: "M")
layoutType("Sunil")


func returnFunc() -> (Int) -> () {
    var counter = 0  // local variable declaration
    func innerFunc(i: Int) {
        counter += i   // counter is "captured"
        print("running total is now \(counter)")
    }
    return innerFunc
    // normally counter, being a local variable, would
    // go out of scope here and be destroyed. but instead,
    // it will be kept alive for use by innerFunc
}

let f = returnFunc()
f(3)  // will print "running total is now 3"
f(4)  // will print "running total is now 7"

// if we call returnFunc() again, a fresh counter
// variable will be created and captured
let g = returnFunc()
g(2)  // will print "running total is now 2"
g(2)  // will print "running total is now 4"

// this does not effect our first function, which
// still has it's own captured version of counter
f(2)  // will print "running total is now 9"

//Think of these functions combined with their captured variables as similar to instances of classes with a method (the function) and some member variables (the captured variables).
//---------------------------------------Closures---------------------------------//
//A combination of a function and an environment of captured variables is called a “closure” in computer programming terminology. So f and g above are examples of closures, because they capture and use a non-local variable (counter) that was declared outside them.


//Closures are blocks of code that you can pass as arguments to functions where the receiving function expects a function type.
//Advantages
//1.No need to create a new function
//2.Swift can infer the parameter types and return type from the context in which the closure is defined. 
//3.Less verbose than when defining a fully fledged function.


// { (params) -> return_type in statements }

let arrayValues = [1,2,3,4,5]
func multiplierUsingForLoop(multiplier: Int,valueArray:[Int]) -> [Int]{
    
    var multiplierArray = [Int]()
    for value in valueArray
    {
        multiplierArray.append(multiplier*value)
        
    }
    print("MULTIPLIER ARRAY USING FOR LOOP ------->\(multiplierArray)")
    return multiplierArray
    
}
let finalValues = multiplierUsingForLoop(multiplier: 2, valueArray: arrayValues)
print(finalValues)

func doubler(x:Int) -> Int{
    return(x * 2)
}

print("MULTIPLIER ARRAY USING Functions in Map ------->\(arrayValues.map(doubler))")

let closureDoubledNums = arrayValues.map(
    {
    (num:Int) -> Int in
    let value = num * 2
    return value
})
print("MULTIPLIER ARRAY USING CLOSURES ------->\(closureDoubledNums)")


arrayValues.map({ (num:Int) -> Int in return(num * 2) })
arrayValues.map({num in return(num*2)})
arrayValues.map({num in num*2 })
arrayValues.map({$0*2})
arrayValues.map(){$0*2}
arrayValues.map{$0*2}







func trackPizzaCount(name:String,initalCount:Int)->(Int)->String{
    var totalCount = initalCount


    return {
        
        (num:Int) -> String in
         totalCount = totalCount + num 

        return "\(name) has eaten \(totalCount) pizzas"
    
    
    }
}

let rajeshTracker = trackPizzaCount(name: "Rajesh",initalCount: 1)
print(rajeshTracker(3))
print(rajeshTracker(2))
print(rajeshTracker(1))


let muraliTracker = trackPizzaCount(name: "Murali",initalCount: 3)
//print(muraliTracker(1))
//print(muraliTracker(2))
print(muraliTracker(3))

print(rajeshTracker(4))
print(muraliTracker(4))
















