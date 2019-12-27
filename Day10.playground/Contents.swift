import Cocoa

var str = "Hello, playground"
//classes
//classes are similar to struct but 5 important differences
//1. classes DON'T come with member-wise initializer

class Dog{
    var name: String
    var breed: String
    
    init(name: String, breed: String){
        self.name = name
        self.breed = breed
    }
}
let poppy = Dog(name: "Poppy", breed: "Poodle")

//2. You can use class inheritance
class Poodle: Dog { //class Poodle inherits from class Dog
    init(name: String){
        super.init(name: name, breed: "Poodle") //calls parent's initializer
    }
    
}
let maria = Poodle(name: "maria")

//child classes can over-ride parent class methods
class Dog1{
    func makeNoise(){
        print("Woof!")
    }
}
//new poodle class that inherits from dog
class Poodle1: Dog1{
    override func makeNoise(){ //overrides function from parent class, need "override" keyword
        print("yip")
    }
}
let evan = Poodle1()
evan.makeNoise()

//if you want to prevent child classes inheriting from your class, declare it as final
final class Dog2{ //classes can't inherit from this class since it's declared as final
    func makeNoise(){
        print("Woof!")
    }
}

//3: When you copy a struct, it's copy by value, when you copy a class, it's copy by reference
class Singer{
    var name = "Taylor Swift"
}
var singer = Singer()
print(singer.name)

var singerCopy = singer //pointing to same place in memory as original singer object is
singerCopy.name = "Justin Bieber"
print(singer.name) //prints "Justin Bieber"
print(singerCopy.name) //prints "Justin Bieber"
//NOTE: if Singer were a struct then we would get "Taylor Swift" for singer.name
//and "Justin Bieber" for singerCopy.name

//4: Classes can have de-initializers, which get run when an instance of a class is destroyed
//e.g. deconstructors
class Person{
    var name = "John Doe"
    
    init(){
        print("\(name) is alive")
    }
    func printGreeting(){
        print("Hello, I'm \(name)")
    }
    deinit{ //de-initializer
        print("\(name) is no more")
    }
    
}

for _ in 1...3{
    let person = Person()
    person.printGreeting()
} //de-initializer being called here, since instance of person is being destroyed

//5: if you have constant struct with variable property, that property can't be changed because the
//struct itself is constant, but, if you have a constant class with a variable property, that
//property CAN be changed, so classes DON'T NEED THE MUTATING KEYWORD; it's not allowed

class Singer1{
    var name = "Taylor" //can change var to let here if you don't want it to be modifiable
}
let taylor = Singer1()
taylor.name = "Ed Sheeran"
print(taylor.name) //this is perfectly fine
