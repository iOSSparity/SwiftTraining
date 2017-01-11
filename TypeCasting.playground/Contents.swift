//: Playground - noun: a place where people can play

import UIKit


//1.TypeCasting (UpCasting + DownCasting)
//2.Why TypeCasting?
//3.Dynamic Method Dispatch
//4.PolyMorphism

//Type casting in Swift is implemented with the is and as operators. These two operators provide a simple and expressive way to check the type of a value or cast a value to a different type

//A constant or variable of a certain class type may actually refer to an instance of a subclass behind the scenes. Where you believe this is the case, you can try to downcast to the subclass type with a type cast operator (as? or as!).
class Animal {
    
    
    func printInfo(){
        
        print("I am an Animal")
        
    }
    
    func printInfo(string: String){
    
        print("Method Overriding Example, \(string)")
    
    }
    
}
class Dog : Animal {
    override func printInfo(){
        
        print("I am a Dog")
    }
    
}

var animalObj: Animal = Animal()
animalObj.printInfo()
animalObj.printInfo(string: "in Swift")

var dogObject: Animal = Dog()
//var newObject : Dog =  Animal() as! Dog
dogObject.printInfo()
//UpCasting
//When Parent class reference variable refers to Child class object, it is known as Upcasting
//You are always allowed to assign an object to a variable, which has a type that is higher in the class hierarchy. The upcast is done implicitly.

//dogObject = animalObj
//dogObject.printInfo()



animalObj = dogObject
//animalObj.printInfo()

let polyMorphismImage = UIImage(named: "polymorphism.jpg")

class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studios")
var fearless = StudioAlbum(name: "Speak Now", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")

var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    // print(album.getPerformance())
    //    let studioAlbum = album as? StudioAlbum
    //    let studioAlbum = album as! StudioAlbum
    
    //    print(studioAlbum?.studio)
    
    //    if album is StudioAlbum {
    //
    //        let studioAlbum =  album as! StudioAlbum
    //        print(studioAlbum.studio)
    //    }else if album is LiveAlbum {
    //
    //        let liveAlbum = album as! LiveAlbum
    //        print(liveAlbum.location)
    //    }
    
    
    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
    //
    //    for album in allAlbums as! [StudioAlbum] {
    //        print(album.studio)
    //    }
}

//Type Casting for Any and AnyObject

//Swift provides two special types for working with nonspecific types:

//Any can represent an instance of any type at all, including function types.
//AnyObject can represent an instance of any class type.

var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append({ (name: String) -> String in "Hello, \(name)" })


for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let stringConverter as (String) -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}






