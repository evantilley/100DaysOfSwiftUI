import Cocoa

var str = "Hello, playground"

//for loops
let count = 1...10
for number in count{
    print("Number is \(number)")
}

let albums = ["test", "test1", "test2"]
for album in albums{
    print("\(album) is on Apple Music")
}

//can also use _ if you're not actually using the value
for _ in 1...5{
    print("play")
}

//while loops
var number = 1
while number <= 20{
    print(number)
    number+=1
}

//repeat loops - while loop but condition to check comes at end; start of loop always runs at
//least once

var number1 = 1
repeat{
    print(number)
    number += 1
} while number <= 20

//exiting loops

var countDown = 10
while countDown >= 0{
    print(countDown)
    
    if countDown == 4{
        break
    }
    countDown -= 1
}
print("Blast off!")

outerLoop: for i in 1...10{ //giving outer loop a label
    for j in 1...10{
        let product = i * j
        print("\(product)")
        if product == 50{
            break outerLoop //breaks out of both loops
        }
    }
}

//continue keyword
for i in 1...10{
    if i%2 == 1{ //odd numbers are skipped
        continue
    }
    print(i)
}
