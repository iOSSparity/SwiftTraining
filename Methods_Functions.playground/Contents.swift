//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Topics To Be Covered
//1.Methods vs Functions
//2.Instance Methods
//3.Type Methods
//4.Type Variables
//5.Subscripts
//5.Inheritance Basics

//Methods

//Functions are self-contained chunks of code that perform a specific task

func printTwoStrings(firstString:String, secondString: String){
    
    print(firstString,secondString , separator:"---GLOBAL FUNCTION CALL----")
    
}

printTwoStrings(firstString: "iPad", secondString: "10.2")

func printInputInfo(inputData: String... ){
    
    inputData.forEach {
        
        print($0)
        
    }
}


//Methods are functions that are associated with a particular type. Classes, structures, and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type

//Functions are standalone, while methods are functions that are encapsulated in a class, struct, or enum.

//---------------------------------Instance Methods-----------------------------------//
//Instance methods are functions that belong to instances of a particular class, structure, or enumeration. They support the functionality of those instances, either by providing ways to access and modify instance properties, or by providing functionality related to the instance’s purpose


//---------------------------------Type Methods-----------------------------------//

//Type methods are methods that are called on the class itself, not on a specific object instance. The static modifier ensures implementation is the same across all class instances.



struct DeviceInfo{
    
    let modelName: String
    var osVersion : String
    static let deviceManufacturer = "Apple"
    
    
    func printDeviceInfo()  {
        
        printInputInfo(inputData: "Model Name: \(modelName)" , "Model OS Version: \(osVersion)")
    }
    
    
    static func printDeviceManufacturerInfo()  {
        
        print("Company Founder: \(self.deviceManufacturer)")
    }
    
    
    
}


class DeviceInfoManager{
    
    var iPadInfo : DeviceInfo = DeviceInfo(modelName: "iPad", osVersion: "10.2")
    var watchInfo : DeviceInfo = DeviceInfo(modelName: "Apple Watch", osVersion: "3.0.1")
    
    
    func printTwoString(firstString:String, secondString: String){
        
        print(firstString,secondString , separator:"---METHOD CALL----")
        
    }
    
    
    func callSameFirstMethod() {
        self.printTwoString(firstString: "iPad", secondString: "10.2")
        printTwoString(firstString: "iPad", secondString: "10.2")
        
    }
    
}


let myClassObj = DeviceInfoManager()
myClassObj.printTwoString(firstString: "iPad", secondString: "10.2")
myClassObj.callSameFirstMethod()
myClassObj.iPadInfo.printDeviceInfo()
myClassObj.watchInfo.printDeviceInfo()
DeviceInfo.printDeviceManufacturerInfo()
DeviceInfo.printDeviceManufacturerInfo()

//---------------------------------Subscripts-----------------------------------//

//A subscript is a key that is used to extract a value from a collection. For example, we use the subscript in array or dictionary.
let iDevices = ["iPhone","iPad","iPod"]
iDevices[0]

//In Swift we can add subscript to our own types.They are used to set and retrieve values by index without needing separate methods for setting and retrieval


class WeekNames {
    
    let names = ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"]
    
    subscript (day: Int ) -> String {
        
        return names[day]
        
    }
    
    
}

let someWeekDay = WeekNames()

print("Day is \(someWeekDay[0])")


extension String {
    subscript(pattern: String) -> Bool {
        get {
            if self.range(of: pattern) != nil{
                
                return true
                
            }else {
                
                return false
            }
            
        }
    }
}

var aString = "We ❤ Swift"
aString["❤"] // true
aString["Hello World"] // false



class RaceWinners {
    private var roles = [String]()
    
    subscript(index: Int) -> String {
        get {
            return index < roles.count ?  roles[index] : "No Winner at \(index) place"
        }
        set {
            self.roles.append(newValue)
        }
    }
}

var winners = RaceWinners()
winners[0] = "MAHESH"
print(winners[1])


//---------------------------------Inheritance-----------------------------------//

//1.A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass.

//2.Classes in Swift can call and access methods, properties, and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties, and subscripts to refine or modify their behavior

//3.Classes can also add property observers to inherited properties in order to be notified when the value of a property changes.
class A{
    
    var name = "In Class A"
    var description = "Example to demonstrate Inheritance"
    func printValue(){
        
        print("name in Class A : \(self.name)")
        
    }
    
}



class B : A {
    
    override func printValue(){
        
        print(super.name)
        print("name in Class B : \(self.name)")
        
    }
    
    
}

let aInstance = A()
aInstance.name = "In Class A"
aInstance.printValue()

let bInstance = B()
bInstance.name = "In Class B"
bInstance.printValue()

//The above mentioned example is not a good example for Inheritance even though it abides to all the Inheritance Concepts.


