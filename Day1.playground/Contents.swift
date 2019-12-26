import Cocoa

var str = "Hello, playground"

str = "Goodbye"

//Swift is type safe so every variable must be of one type

var age = 38
var population = 8_000_000 //use underscores to make large numbers easier to read

//line-breaks in a string/multi-line strings
var str1 = """
This goes
over multiple
lines
"""

//to not include \n
var str2 = """
This goes \
over multiple \
lines
"""

//Double is number with decimal places; different from integers
var pi = 3.141

//Booleans are either true or false
var awesome = true

//String interpolation - place variables inside strings
var score = 85
var str3 = "Your score was \(score)"
var results = "The test results are here: \(str3)"

//constants - never change value; use "let" keyword instead of "var" keyword
let taylor = "swift"

//Swift assigns each variable and constant a type, based on what variable it's given when it's created
//this is called Type Inference
//but, you can be explicit about the type of your data - type annotation
let album: String = "Reputation"
let year: Int = 1989
let test: Bool = true
let test1: Double = 9.9
