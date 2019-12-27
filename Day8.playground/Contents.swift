import Cocoa

var str = "Hello, playground"

//you can use Structs to design your own types
//Structs can be given their own variables, constants, and functions
//NOTE: YOU NEED TYPE ANNOTATION IF YOU'RE NOT INITIALIZING THE VARIABLE in same line

//struct with one property
struct Sport{
    var name: String
}
//instance of struct
var tennis = Sport(name: "Tennis")
print(tennis.name)
tennis.name = "Lawn tennis"
print(tennis.name)

//the name property in struct Sport is a STORED property
//there is also COMPUTED property - runs some code to figure out its value
//COMPUTED PROPERTIES MUST ALWAYS HAVE AN EXPLICIT TYPE; also, can't be constants
struct Sport1{
    var name: String
    var isOlympicSport: Bool
    
    var olympicStatus: String{ //computed property - returns different values depending on other properties
        if isOlympicSport{
            return "\(name) is an Olympic sport"
        } else{
            return "\(name) is not an Olympic sport"
        }
    }
}

let chessBoxing = Sport1(name: "Chessboxing", isOlympicSport: false)
print(chessBoxing.olympicStatus)

//Property Observers let you run code before or after any property changes
//can't attach property observer to a constant, because constants never change
struct Progress{
    var task: String
    var amount: Int {
        didSet{ //didSet is the most common property observer
            print("\(task) is now \(amount)% complete")
        }
    }
}

var progress = Progress(task: "Loading data", amount: 0)
progress.amount = 30
progress.amount = 80
progress.amount = 100

//we want Swift to print a message every time amount changes
//use didSet property
//NOTE: can also use willSet to do something BEFORE property changes, but rarely used

//methods are functions inside structs
struct City{
    var population: Int
    
    func collectTaxes() -> Int{
        return population * 1000
    }
}
let london = City(population: 9_000_000)
london.collectTaxes()

//if a struct has a variable property but the instance of the struct
//was created as a const, that property can't be changed
//struct is constant, so all its properties are also constant
//BY DEFAULT, whether let or var, SWIFT WON'T LET YOU WRITE METHODS THAT
//CHANGE PROPERTIES OF STRUCT
//when you want to change property inside method, mark it with "mutating" keyword
struct Person{
    var name: String
    
    mutating func makeAnonymous(){ //this method can only be called on var instance of struct
        name = "Anonymous"
    }
}
var person = Person(name: "Ed")
print(person.name)
person.makeAnonymous() //change name property
print(person.name)

//Strings are structs with their own properties and methods
let string = "Do or do not, there is no try."
print(string.count) //counts number of characters
print(string.hasPrefix("Do")) //true since string starts with "Do"
print(string.uppercased()) //uppercase
print(string.sorted()) //sorted alphabetically into an array)

//Arrays are also structs with their own properties and methods
var toys = ["Woody"]
print(toys.count)

toys.append("Buzz")
toys.firstIndex(of: "Buzz")

print(toys.sorted()) //printed alphabetically sorted array
toys.remove(at: 0)
print(toys)


