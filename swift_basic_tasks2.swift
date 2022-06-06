import Foundation

func minVal(a: Int, b:Int) -> Int {
if a>b { return b } else { return a }
}

print("minVal: \(minVal(a: 2, b: 7))")
print("minVal: \(minVal(a: 10, b: 5))")
print("minVal: \(minVal(a: -100, b: 100))")
print("minVal: \(minVal(a: 1, b: 1))")

func lastDigit(_ num: Int) -> Int { return num%10 }

print("lastDigit: \(lastDigit(123445))")

func divides(_ a: Int, _ b: Int) -> Bool {
if a%b == 0 { return true } else { return false }
}

print("is 7 divisible by 3? \(divides(7, 3))") // false - 7 is not divisible by 3
print("is 8 divisible by 4? \(divides(8, 4))") // true - 8 is divisible by 4

func countDivisors(_ num: Int) -> Int {

var divSum = 0
for i in 1...num {
if num%i==0 { divSum+=1 }
}

return divSum

}

print("Count divisors of 1: \(countDivisors(1))") // 1 - 1
print("Count divisors of 10: \(countDivisors(10))") // 4 - 1, 2, 5 and 10
print("Count divisors of 12: \(countDivisors(12))") // 6 - 1, 2, 3, 4, 6 and 12

func isPrime(_ num: Int) -> Bool {
if(countDivisors(num)<3) { return true } else { return false }
}

print("Is 3 a prime number? \(isPrime(3))") // true
print("Is 8 a prime number? \(isPrime(8))") // false
print("Is 13 a prime number? \(isPrime(13))") // true

var greatSwift: () -> String = { return "I will pass this course with best mark, because Swift is great!\n" }

func smartBart( _ n: Int, _ phrase: () -> (String)) -> String  {

var out = ""

for i in 1...n { out = out + phrase() }

return out

}

print(smartBart(11, greatSwift))

let numbers = [10, 16, 18, 30, 38, 40, 44, 50]

let filterNum = numbers.filter{$0%4==0}

print(filterNum)

let reducedNum = numbers.reduce(0){max($0, $1)}

print(reducedNum)

var strings = ["Gdansk", "University", "of", "Technology"]
 
let pgOut = strings.reduce(""){$0 + " " + $1}
print(pgOut)

let numbers2 = [1, 2 ,3 ,4, 5, 6]

let oddNum = numbers2.filter{!($0%2==0)}
let squareNum = oddNum.map{Int(pow(Double($0), 2))}
let squareSum = squareNum.reduce(0){$0+$1}

print(squareSum)

func minmax (_ a: Int, _ b: Int) -> (Int, Int) { if(a>b) { return (a,b) } else { return(b,a) } }

print("for 2 and 3: Max = \(minmax(2,3).0) and Min = \(minmax(2,3).1)")

var stringsArray = ["gdansk", "university", "gdansk", "university", "university",
"of", "technology", "technology", "gdansk", "gdansk"]


func countStrings(_ arr: Array<String>) -> [(String, Int)] {


var tmp = arr
tmp.sort()

var out: [(str: String, cnt: Int)] = []

var fString = tmp[0]
var count = 1

for i in 1...(tmp.count-1) {

if (tmp[i]==fString) { count+=1 } else {

    out+=[(str: fString, cnt: count)]
    count = 1
    fString = tmp[i]

    }
}

out+=[(str: fString, cnt: count)]


return out

}

var countedStr: [(String, Int)] = countStrings(stringsArray)

print(countedStr)


enum Day: Int {
case Monday = 1
case Tuesday
case Wednesday
case Thursday
case Friday
case Saturday
case Sunday

func eachDayEmoji() -> String {
        switch self {
            case .Monday:
            return "💀"
            case .Tuesday:
            return "🚜"
            case .Wednesday:
            return "🤤"
            case .Thursday:
            return "🍄"
            case .Friday:
            return "🍻"
            case .Saturday:
            return "🏎"
            case .Sunday:       
            return "🔔"
        }
    }
}

let Today = Day.Tuesday
print("Emoji for today: \(Today.eachDayEmoji()) (f'course issa big body Tönka)")