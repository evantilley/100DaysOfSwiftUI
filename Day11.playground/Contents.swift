import Cocoa

var str = "Hello, playground"

//protocols
//protocols are a way of describing what properties and methods something must have
//tell swift which types adopt/conform to this protocol

//create ID protocol
//requires all conforming types to have an ID string that can be read (get)
//or written (set)
//protocols need type identification for variables (e.g. explicit types)
//NOTE: Protocols can declare properties as read-only (get) but not write-only(set)
protocol Identifiable {
    var id: String{get set}
}
//we can't create instances of this protocol, it's a description
//we can create a struct that conforms to this protocol:
struct User: Identifiable{
    var id:String //conforms to Identifiable protocol
}
//accepts any Identifiable object as parameter
func displayID(thing: Identifiable){
    print("My ID is \(thing.id)")
}
var evan = User(id: "1234")
displayID(thing: evan)

//Protocol inheritance - one protocol can inherit from another
//can inherit from multiple protocols at the same time
protocol Payable{
    func calculateWagers() -> Int
}

protocol NeedsTraining {
    func study()
}

protocol HasVacation {
    func takeVacation(days: Int)
}

protocol Employee: Payable, NeedsTraining, HasVacation{
    
} //inherits from all 3 protocols

struct Bob: Employee{
    func calculateWagers() -> Int {
        return 4
    }
    func study() {
        print("studying")
    }
    func takeVacation(days: Int) {
        print("Took vacation of \(days) days")
    }
}

var x = Bob()

//Extensions - allow you to add methods to existing types
extension Int { //an extension to the Int type
    func squared() -> Int{
        return self * self
    }
}

let number = 8
number.squared()
//NOTE: You can't add stored properties in extensions, so you must use
//computed properties instead
extension Int{
    var isEven: Bool{ //need the type annotation here
        return self%2 == 0
    }
}
let test = 10
test.isEven

//Protocol extensions - like regular extensions but rather than extending a
//specific type like Int, you extend a whole protocol so that all conforming types
//get your changes
let pythons = ["test1", "test2", "test3"]
let beatles = Set(["john", "lennon"])
//arrays and sets both conform to protocol called collection
extension Collection {
    func summarize(){
        print("There are \(count) of us:")
        
        for name in self{
            print(name)
        }
    }
}
//both array and set now have the method
pythons.summarize()
beatles.summarize()

//protocol-oriented programming - crafting your code around protocols and protocol extensions
protocol Identifiable1{
    var id: String {get set}
    func identify()
}
//see, we could make each identifiable object provide its own identify() method
//but protocol extensions let us provide a default
extension Identifiable1{
    func identify(){
        print("My id is \(id)")
    }
}
//now, when we create a type that conforms to Indentifiable, it gets identify() automatically
struct User1: Identifiable1{
    var id: String
}
var test1 = User1(id: "evan")
test1.identify()

//NOTE: protocols don't provide implementations of methods, but protocol extensions do
