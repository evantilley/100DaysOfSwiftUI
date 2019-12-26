import Cocoa

var str = "Hello, playground"

//using closures as parameters when they accept parameters
//we've been using () -> Void e.g. accepts no parameters and returns nothing
//can fill () with types that your closure should accept
func travel(action: (String) -> Void){
    print("I'm getting ready to go.")
    action("London") //passing London to action closure
    print("I arrived")
}

//closure - takes string as a parameter and returns Void
var action = {(test: String) in
    print("I'm going to \(test) in my car")
}
//calling travel with closure
travel(action: action)

//EQUIVALENTLY:
//calling travel using trailing closure syntax
travel{ (place: String) in
    print("I'm going to \(place) in my car")
}

//another example:
//function that takes closure (named positioning) which takes an array of strings and
//returns void
func createInterface(positioning: ([String]) -> Void){
    print("Creating some buttons")
    let buttons = ["Button 1", "Button 2", "Button 3"]
    positioning(buttons) //calling closure
}
//calling function with trailing closure syntax
createInterface { (buttons: [String]) in //note: in this closure, we're naming the parameter buttons
    for button in buttons{
        print("I'll place \(button) here...")
    }
}

//using closures as parameters when they return values
func travel1(action: (String) -> String){
    print("I'm getting ready to go")
    let description = action("London")
    print(description)
    print("I arrived")
}

//long way:
//making a closure
var action1 = {(place: String) -> String in
    return "I'm going to \(place) in my car"
}
//passing that closure into the function
travel1(action: action1)

//trailing closure syntax
travel1 { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

//function
func manipulate(numbers: [Int], using algorithm: (Int) -> Int){
    for number in numbers{
        let result = algorithm(number)
        print("Manipulating \(number) produced \(result)")
    }
}
//trailing closure syntax
manipulate(numbers: [1,2,3]){(number: Int) -> Int in
    return number * number
}

//note: technically you don't have to specify return type:
manipulate(numbers: [1,2,3]){(number: Int) in
    return number * number
}
//or even parameter type:
manipulate(numbers: [1,2,3]){number in //Swift automatically infers type/return value
    return number * number
}

//Formal notes for shorthand parameter names
func travel2(action: (String) -> String){
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I've arrived")
}

//how we would normally do it
travel2{(place: String) -> String in
    return "I'm traveling to \(place)"
}
//Swift know that the parameter to the closure must be be a string and it
//also knows that the closure must be a string so we can remove those types:
//shorthand calling the function with trailing closure syntax
travel2{ place in
    "I'm traveling to \(place)" //can also remove return keyword since only one line of code
}

//we can also let Swift provide automatic names for a closure's parameters
travel2{ //notice how you don't need the "in" keyword here
    "I'm traveling to \($0)" //shorthand parameter names
}

//closures with multiple paramaters
func travel3(action: (String, Int) -> String){
    print("I'm getting ready to go")
    let description = action("London", 60)
    print(description)
    print("I've arrived")
}
//calling the function
travel3 {
    "I'm going to \($0) which is \($1) miles away" //these are called shorthand parameter names
}

//returning closures from a function
func travel4() -> (String) -> Void{ //returns a closure that accepts a string and closure returns void
    return {
        print("I'm going to \($0)")
    }
}
//calling travel4
let result4 = travel4()
result4("London")
//you can also do this directly
let result2 = travel4()("London")

//capturing values
//if you use external values inside closure, swift captures them and stores them alongside the closure
//so you can modify them
func travel5() -> (String) -> Void{ //returns a closure that accepts a string and closure returns void
    var counter = 1
    return {
        print("\(counter) I'm going to \($0)")
        counter += 1
    }
}

//closure capturing happens if we create values in travel5 THAT GET USED INSIDE THE CLOSURE
//even though counter variable was created inside travel5 it gets captured by the closure so
//it will remain alive for that closure
let result5 = travel5()
result5("London") //count is 1
result5("London") //count is 2
result5("test") //count is 3
let result6 = travel5()
result6("London") //count is 1
result6("London") //count is 2



