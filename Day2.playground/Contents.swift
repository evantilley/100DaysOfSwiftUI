import Cocoa

var str = "Hello, playground"

let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

//an array of strings
let beatles = [john, paul, george, ringo]
beatles[1]

//with type annotations, arrays are written in brackets
let beatlesv1: [String] = [john, paul, george, ringo]

//sets - collections of values like arrays
//2 diffs:
//1. items not stored in set order
//2. all items must be unique (no items can appear twice); duplicate items get ignored
let colors = Set(["red", "green", "blue"])

//tuples are like arrays but
//1. They are immutable 2. Can't change types of item in tuple
//also, items in tuples can be named, like here name.0 and name.first are the same
var name = (first: "Taylor", last: "Swift")
name.0
name.first

//arrays vs sets vs tuples

//if you need a specific, fixed collection of values where each value has a name
//use a tuple
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")

//if you need collection of unique values that you can check very fast whether and item
//is in the set, use a set
let set = Set(["test1", "test2", "test3"])

//if you need collection of values where order matters or you need duplicates, use array
let pythons = ["bob", "evan", "maria", "jess"]

//dictionaries are collections of values but we access the values using keys rather
//than integer positions; key-value pairs
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]
//for type annotation: [key type: value type]
let dictionary: [String: Int] = ["Alex": 31, "Paul": 39]

//if you try and read value from dictionary using key that doesn't
//exist, you get nil
//we can provide a default value for dictionary to use if we request a missing key
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["Charlotte", default: "Unknown"] //we get back "Unknown" instead of nil

//create empty dictionary with Strings for keys and values
var teams = [String: String]()
teams["Paul"] = "Red"
//empty array
var results = [Int]() //need empty () after the type
//empty set
var words = Set<String>()

//note: also alternative syntax for dictionaries and strings
var scores = Dictionary<String, Int>()
var results1 = Array<Int>()

//enums are a way of defining groups of related value
enum Result{
    case success
    case failure
}

let result4 = Result.failure

//enums can store associated values attached to each case: enum associated values

enum Activity{
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

//enum raw values
enum Planet: Int{
    case mercury = 1 //overriding raw values; assigning 1 to mercury and count up from there
    case venus
    case earth
    case mars
}
//mercury is given number 0, venus #1, earth #2, mars #3

let venus = Planet(rawValue: 2)
let earth = Planet(rawValue: 3)





