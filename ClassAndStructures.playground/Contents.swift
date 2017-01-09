//: Playground - noun: a place where people can play

import UIKit

/*
 
 Class and Structures
 */

/*
 
 I. Comparing Classes and Structures.
 II. Definition Syntax
 III. Memberwise initializers for structure types.
 IV. Structs and enums are value types
 V. Classes are reference types
 VI. Identity Operators
 VII. Assignment and copy behavious of Strings, Arrays and Dictionaries
 
*/

//// I. Comparing Classes and Structures.
/*
 1. Define properties to store values
 2. .. methods to provide functionality
 3. Initializers
 4. expand their functionality
 5. conform to protocols
 
 classes have additional capabilities that struct do not do
 1. Inheritence
 2. Deinitializers
 3. TypeCasting (check and interpret at runtime)
 4. Reference counting allows more than one ref to a class instance
 */



//// II. Definition Syntax

class SomeClass {
    
}

struct SomeStructure {
    
}

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var frameRate = 0
    var name: String?
}

// Instances
let strucObject = Resolution()
let classObject = VideoMode()


//// III. Memberwise initializers for structure types.
// All structures have automatically generated member-wise initializers => used to initialize the member properties of new structure instances

let vga = Resolution(width: 640, height: 480)


//// IV. Structs and enums are value types
// All basic swift tyoes are value types (String, Int, Array, Dictionaries etc.,)
var cinema = vga
cinema.width = 1024
cinema.height = 768
print(cinema.width)
print(vga.width)

enum CompassPointer {
    case east, west, north, south
}
var currentDirection = CompassPointer.north
var storeDirection = currentDirection
storeDirection = .east
print(currentDirection)
print(storeDirection)


//// V. Classes are reference types
// 
let oneX = VideoMode()
oneX.frameRate = 24
oneX.name = "One X Quality"

let twoX = VideoMode()
twoX.frameRate = 30
print(oneX.frameRate)
print(twoX.frameRate)


//// VI. Identity Operators
/*
 Because classes are refence type
        it is possible for multiple constants and variables to refer to the same single instance of class
 
 The same is not true for structures and enums - since they are value types.
 
 */

// it can sometimes be useful to find out if two constants or variable refer exactly to the same instance of a class.
// =========> for this swift provide identity operator.

if oneX === twoX {
    print("Both objects refer to the same class instance")
} else if oneX !== twoX {
    print("Both objects do not refer to the same class instance")
}

/*
 1. 'identical to' => two constants or variables of class type refer to the same class instance.
 2. 'Equals to' => two instance are considered 'equal' or 'equivalent' in value
 */



//// VII. Assignment and copy behavious of Strings, Arrays and Dictionaries

/*
 
 1. In Swift
            - Many basic data types such as Strings, Arrays and Dictionary are implemente as structures.
                => are copied when they are assigned to new constant or var, or when they are passed to a method ot func.
 2. Foundation: NSString, NSArray, NSDictionary =>
            - are implemented as classes not structures.
            - these three are always assigned are passed as a refence to an existing instance rather than as a copy.
 */


/****************************
 
                            Properties
 
 Properties associate values with a particular Class, struct or enums
 
 ****************************/

/*
 Stored and computed properties
 
 1. Stored properties store constatnt and variable values as part of an instance, whereas computed properties calculate (rather than store) a value.
 2. Computed prop are provided by Classes, structs and enums, whereas stored properties are provided only by Classes and structures.
 
 Stored and computed properites are usually associated with instances of a particular type.
 properties can also be associated with the type itself (called type properties).
 - You can define property observers to monitor changes in a property value.
 
 
 */

/*
 I. Stored Properties and its constant structure instances
 II. Lazy Stored Properties
 III. Computed Properties
 IV. Read-Only Computed Properties
 V. Property Observers
 
 */


//// I. Stored Properties and its constant structure instances

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangesStruct = FixedLengthRange(firstValue: 4, length: 3)
print(rangesStruct.firstValue)
rangesStruct.firstValue = 5
print(rangesStruct.firstValue)
//constant
let rangesStructConstant = FixedLengthRange(firstValue: 10, length: 3)
//print(rangesStructConstant.firstValue)
//rangesStructConstant.firstValue = 5
//print(rangesStructConstant.firstValue)


//// II. Lazy Stored Properties
// It is a property whose initial value is not calculated untill the first time it is used.
// declare always as variable (var keyword)

//eg:- 
class DataImporter {
    /*
     This is a class to import data from external  file and is assumed to take a non-trivial amount of time to initialize
     */
    var fineName = "data.txt"
    // importing functionality
}

class DataManager {
    lazy var importer = DataImporter()
    
    var data = [String]()
    
}
let manager = DataManager()
manager.data.append("newData")

// in the next line, an instance is create when accessed
print(manager.importer.fineName)

// if this lazy prop is accessed by multiple threads simultaneously and the property has not yet been initialized, there is no gurantee that property will be initialized once.

//// III. Computed Properties
// In addition to stored properties; classes, structures, and enumerations can define computed properties, which do not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    
    var output : Double {
        return ((size.width) * (size.width)) * (size.width)
    }
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

let pt = Point(x: 0, y: 0)
let siz = Size(width: 20, height: 20)
var sq = Rect(origin: pt, size: siz)
print(sq.origin.x)
sq.center = Point(x: 30, y: 30)
print(sq.origin.x)
print(sq.origin.y)


var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
print("square.origin is at (\(square.origin.x), \(square.origin.y))")
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")

/*
 This example defines three structures for working with geometric shapes:
 
    1. Point encapsulates the x- and y-coordinate of a point.
    2. Size encapsulates a width and a height.
    3. Rect defines a rectangle by an origin point and a size.

 */

//// IV. Read-Only Computed Properties

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")

//// V. Property Observers
/*
 1. You can add property observers to any stored properties you define, except for lazy stored properties.
 2. You can also add property observers to any inherited property (whether stored or computed) by overriding the property within a subclass
 
 You have the option to define either or both of these observers on a property:
 
    1. "willSet" is called just before the value is stored.
            - it’s passed the new property value as a constant parameter (newValue)
    2. "didSet" is called immediately after the new value is stored.
            - it’s passed a constant parameter containing the old property value (oldValue)

 */

class CustomView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var customRadius : CGFloat = 0 {
        didSet {
            layer.cornerRadius = customRadius
        }
    }
}

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
    
    var steps: Int = 0 {
        willSet(currentSteps) {
            print(currentSteps)
        }
    }
    var viewLayer = CustomView()
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896

print(stepCounter.steps)
stepCounter.steps = 10
















