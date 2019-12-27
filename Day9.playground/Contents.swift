import Cocoa

var str = "Hello, playground"
//initializers let you create structs
//default initializer is member-wise construction

struct User{
    var username: String
    
    init(){ //initializer - needs to initalize every property of struct
        username = "Anonymous"
        print("Creating a new user...")
    }
}

//if there was no initializer you could do: var user = user(username: "twostraws")
//but, with initializer:
var user = User()
user.username = "twostraws"

//inside methods, self is a constant that points to current instance of struct
struct Person{
    var name: String
    
    init(name: String){
        print("\(name) was born")
        self.name = name //property is self.name and parameter is name
    }
}
var guy = Person(name: "Evan")
print(guy.name)

struct FamilyTree{
    init() {
        print("Creating family tree...")
    }
}

struct Person1{
    var name: String
    lazy var familyTree = FamilyTree() //Swift only creates this struct when it's first accessed
    
    init(name: String){
        self.name = name
    }
}

var ed = Person1(name: "Ed")
ed.familyTree //here, Swift will create the familyTree property


//static properties; you can have static functions, variables, and constants
struct Student{
    static var classSize = 0 //belongs to the struct itself, not instances of the struct
    var name: String
    
    init(name: String){
        self.name = name
        Student.classSize += 1
    }
}

let john = Student(name: "John")
let taylor = Student(name: "Taylor")
print(Student.classSize) //use Student here because classSize belongs to the struct itself

//access control - lets you restrict which code can use properties and methods
//NOTE: Swift can't create memberwise initializer if there is a private property
struct Person2{
    private var id: String //only methods inside Person2 can read the id property
    
    init(id: String){
        self.id = id
    }
    func identify() -> String{ //since method inside struct, can access private variable
        return "My Social Security number is \(id)"
    }
}
let evan = Person2(id: "12345")
evan.identify()
