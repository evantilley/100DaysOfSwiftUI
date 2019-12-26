import Cocoa

var str = "Hello, playground"

let firstScore = 12
let secondScore = 4

let total = firstScore + secondScore
let difference = firstScore - secondScore

let product = firstScore * secondScore
let quotient = firstScore / secondScore
let remainder = 13 % secondScore

//operator overloading - what an operator does depends on the type it's used with

let meaningofLife = 42
let doubleMeaning = 42 + 42

let fakers = "Fakers gonna "
let actions = fakers + "fake"

let firstHalf = ["John", "Paul"]
let secondHalf = ["George", "Ringo"]
let beatles = firstHalf + secondHalf

//compound assignment operators
var score = 95
score -= 5

var quote = "The rain in Spain falls mainly on the "
quote += "Spaniards"

//comparison operators
let firstScored = 6
let secondScored = 4

firstScored == secondScored
firstScored != secondScored

firstScored < secondScored
firstScored >= secondScored

"Taylor" <= "Swift"

//conditions
let firstCard = 11
let secondCard = 10
if firstCard + secondCard == 2{
    print("Aces!")
} else if firstCard + secondCard == 21{
    print("Blackjack!")
} else{
    print("Regular Cards")
}

let age1 = 12
let age2 = 21

//and; short-circuit evaluation
if age1 > 18 && age2 > 18{
    print("Both are over 18")
}
if age1 > 18 || age2 > 18{
    print("One is over 18")
}

//ternary operator
let firstCard1 = 11
let secondCard1 = 10
//if cards are the same, print "Cards are the same", else, print "Cards are different"
print(firstCard1 == secondCard1 ? "Cards are the same" : "Cards are different")

//can use switch instead of multiple if-else statements
let weather = "sunny"
switch weather{
case "rain":
    print("Bring an umbrella")
case "snow":
    print("Dress warmly")
case "sunny":
    print("Wear sunscreen")
    fallthrough //causes code to continue on to next case, rather than stopping
default: //required to cover all possible cases
    print("Enjoy your day")
}

//range operators - there is ... (closed-range) and ..< (half-open)
let score1 = 85
switch score1{
case 0..<50:
    print("You failed")
case 50..<85:
    print("Okay")
default:
    print("Great")
}
//prints "Great"

let x = 1...10
print(x)

