import Cocoa

var str = "Hello, playground"

//swift lets us use functions like any other type (e.g. Strings/Integers)
//so, you can create a function and assign it to a variable, call that
//function using that variable, and pass that function into other functions
//as a paramter
//these are called closures

//NOTE:closures put parameters, etc. inside the {}
//this creates a function without a name, and assigns that function to driving
let driving = {
    print("I'm driving in my car")
}
//we can now call driving as if it were a regular function:
driving()

//accepting parameters with closures
//parameters are listed in () inside the {}
//the "in" keyword after the () lets Swift know that the main body of the closure is starting
let driving1 = { (place: String) in
    print("I'm going to \(place) in my car")
}
//NOTE: you don't use parameter labels when calling closures! (unlike with functions)
driving1("London")

//also NOTE: closures cannot use external parameter labels
var cutGrass = { (currentLength: Double) in
    switch currentLength{
    case 0...1:
        print("Too short")
    case 1...3:
        print("Good")
    default:
        print("Okay")
    }
}
cutGrass(1.1) //prints "Good"

//closures can also return values
//write type of value to be returned inside closure, BEFORE the "in" keyword
let driving2 = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}
let message = driving2("Columbia")
print(message)

//closures as parameters
//since closures can be used like Strings and Integers, we can pass them into functions
let driving3 = {
    print("I'm driving in my car")
}
//to pass this closure into a function so it can be run inside the function
//specify the parameter type as () -> Void; can also do () -> ()
//means it accepts no parameters, and returns Void

//function that takes closure as parameter
func travel(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}

travel(action: driving3)

//if last parameter to function is closure, you can use trailing closure syntax
//rather than passing closure as paramter, you can pass it directly after
//the function, inside {}
func travel1(action: () -> Void) {
    print("I'm getting ready to go")
    action()
    print("I arrived!")
}
//last paramter is a closure, so we can call travel using trailing closure syntax
travel(){
    print("I'm driving in my car")
}
//note: because there aren't any other parameters, we can eliminate the ()
travel1{
    print("I'm driving in my car")
}
