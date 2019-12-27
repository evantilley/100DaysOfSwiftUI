import Cocoa

var str = "Hello, playground"

//optionals can be made out of any type
//an optional integer might have a value like 10 but it also might be missing, have a value of nil
//to make a type optional, add a ? after it
var age: Int? = nil //holds nothing, but, if we later learn the age value, we can change it
age = 38

//optional strings might contain a string or it might be nil
var name: String? = nil
//it's unsafe to try and do name.count here since it's nil
//we must look inside the optional and see what's there - UNWRAPPING
//if name holds a string, it will be put inside unwrapped constant
//if name is empty, the else code will be run
//this is called unwrapping with optionals
if let unwrapped = name{
    print("\(unwrapped.count) letters")
} else{
    print("Missing name")
}

//can also unwrap with guard, but, if it finds nil inside then exits function/loop
//with guard, unwrapped optional remains usable after the guard code
//if you've gotten passed guard, rest of the function can run nicely
//NOTE: guard must be followed by an else statement
func greet(_ name: String?){
    guard let unwrapped = name else{
        print("You didn't privde a name!")
        return
    }
    print("Hello, \(unwrapped)") //will only execute if got passed the guard statement
}
greet(nil)
greet("Evan")

//Force unwrapping - you can do this when you know for sure that a value isn't nil
let str1 = "5"
let num = Int(str1) //makes num an optional int, because you might have tried to convert a non-int string
//if you do print(num) now, it's still an optional
print(num)
//we can force unwrap the result like this:
let num1 = Int(str1)!
print(num1)
//only force unwrap when you're sure it's safe
//NOTE if you try and convert non-numeric string to int it will return nil

//implicity unwrapped optionals - might contain a value or might be nil, but
//you can use them as if they weren't optional at all
//add ! after type name
var age1: Int! = nil
//don't need to unwrap but if you try and use them and they're nil, code will crash
age1 = 10
var age2 = age1 + 10 //using optional without unwrapping first
print(age2)

//Nil coalescing - unwraps operator and returns value inside if there is one
//if value is nil, uses a default value
//either way, the result won't be optional
func username(for id: Int) -> String?{
    if id == 1{
        return "Taylor Swift"
    } else{
        return nil
    }
}

let user = username(for: 15) ?? "Anonymous" //this checks result that comes back from function
                                            //if result is string, unwrap it and place into user
                                            //if result is nil, then place "Anonymous" inside user variable
print(user)
//NOTE: ?? is called the nil coalescing operator
//NOTE: data type on left of ?? must be same as data type on right of ??

//OPTIONAL CHAINING - if you want to access a.b.c and b is optional, you can write
//a ? after it to enable optional chaining: a.b?.c
//swift checks if b has value, and, if nil, rest of line ignored and nil returned
//if has a value, it'll be unwrapped and execution will continue
let names = ["John", "Paul", "George", "Ringo"]
let beatle = names.first?.uppercased()
//NOTE: accessing first property returns an optional
//accesing key of dictionary is also optional

//you can change try to try?
//if function throws an error you'll get nil, otherwise you'll get return value
//wrapped as an optional
func test() -> String{
    return "ye"
}

if let result = try? test(){
    print("not nil")
}else{
        print("nil")
    }
//can also use try! which is when you know the function won't throw an error
//if the function does throw an error, your code will crash
try! test()
print("ok")

//failable initializers
let str2 = "5"
let num2 = Int(str1) //failable initializer - might work and might not
//we can write our own failable initializers
struct Person{
    var id: String
    init?(id: String){ //failable initializer
        if id.count == 9{
            self.id = id
        } else{
            return nil
        }
    }
}
//typecasting
class Animal{}
class Fish: Animal{}

class Dog: Animal {
    func makeNoise(){
        print("Woof!")
    }
}
let pets = [Fish(), Dog(), Fish(), Dog()]
//an array of animal objects since they inherit from animal
//as? is nil if the typecast failed or a converted type otherwise
for pet in pets{
    if let dog = pet as? Dog{
        dog.makeNoise()
    }
}
