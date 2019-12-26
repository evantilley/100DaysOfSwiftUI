import Cocoa

var str = "Hello, playground"

func printHelp(){
    let message = """
Welcome to MyApp!

This is a test.
"""
    print(message)
    
}

printHelp() //calling the function

//giving function parameters
func square(number: Int){
    print(number * number)
}
square(number: 8)

//return from functions
func square1(number: Int) -> Int{
    return number * number
}

let result = square1(number: 8)
print(result)

//function that uses 2 names for its String parameter
//externally, called "to", but internally called "name"
func sayHello(to name: String){
    print("Hello \(name)!")
}
sayHello(to: "Taylor")

//when we use print, we don't use any parameter names
//we can do this using _, which makes our external variable name nothing

func greet(_ person: String){
    print("Hello, \(person)!")
}
//can call greet without using person
greet("Taylor")

//nicely is default parameter
func greet1(_ person: String, nicely: Bool = true){
    if nicely == true{
        print("Hello, \(person)!")
    } else{
        print("sus")
    }
}

greet1("Taylor")
greet1("Taylor", nicely: false) //overriding default parameter

//variadic functions - accept any number of parameters of the same type
//write ... after it's type
//Int ... is 0 or more integers - swift converts to array of integers
func square(numbers: Int...){
    for number in numbers{
        print(number * number)
    }
}
square(numbers: 1, 2, 3, 4, 5)

//throwing functions - functions that can throw errors

enum PasswordError: Error{ //conforms to Error
    case obvious
}

func checkPassword(_ password: String) throws -> Bool{ //need "throws" before return type
    if password == "password"{
        throw PasswordError.obvious
    }
    return true
}
//do: starts a section of code that might cause problems
//try: used before every function that might throw an error
//catch: lets you handle errors gracefully
//if errors thrown in do block, then execution jumps to catch block


do{
    try checkPassword("password")
    print("That password is good") //we won't get here
} catch{
    print("Password is bad")
}

//inout parameters
//normally all parameters passed into swift function are constants so
//you can't change them, but in-out parameters can be changed inside function
//THOSE CHANGES REFLECT IN THE ORIGINAL VALUE OUTSIDE THE FUNCTION
func doubleInPlace(number: inout Int){
    number *= 2
}
var num = 2 //must be a variable to be used with inout
doubleInPlace(number: &num) //need to use & to show you recognize it's being passed as inout
print(num) //num is now 4
//note resemblance to C with & - like passing in pointer to object 

