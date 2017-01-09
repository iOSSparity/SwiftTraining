//: Playground - noun: a place where people can play

import UIKit

//let attendees: Set = ["Alicia", "Bethany", "Diana"]
//let visitors: Set = ["Marcia", "Nathaniel", "Bethany"]
//
//      let attendeesAndVisitors = attendees.symmetricDifference(visitors)
//      print(attendeesAndVisitors)
//      // Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"
//


enum DayOfTheWeek: Int {
    case sunday, monday, tuesday, wednesday, thursday,
    friday, saturday
}

var classDays: Set<DayOfTheWeek> = [.wednesday, .friday]
print(classDays.insert(.monday))
print(classDays.insert(.monday))

print(classDays)
// Prints "[.friday, .wednesday, .monday]"

print(classDays.insert(.friday))
// Prints "(false, .friday)"
print(classDays)
// Prints "[.friday, .wednesday, .monday]"

let hashV = "Bethany".hashValue
let h1  = "bethany".hashValue
let hashV1 = "Bethany".hashValue

var attendees: Set = [ "Bethany", "Diana", "Diana"]
//attendees.insert("Diana")
attendees.count
attendees.update(with: "diana")
attendees.count
print(attendees)

let visitors: Set = ["Marcia", "Nathaniel"]
attendees.formUnion(visitors)
print(attendees)
// Prints "["Diana", "Nathaniel", "Bethany", "Alicia", "Marcia"]"

let dictionary = ["1": "a", "2": "a2", "3": "3a"]
for out in dictionary {
    print(out.0, out.1, separator:",")
}




