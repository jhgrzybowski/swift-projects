import Foundation

var a=5, b=10

print("\(a) + \(b) = \(a+b)")

var str = "Gdansk University of Technology"

for ch in str {
    if ch=="n" { print("⭐", terminator: "") } else { print(ch, terminator: "") }
}

var ja = "Jakub Hubert Grzybowski"

let rev = String(ja.reversed())
print("\n\(rev)")

for i in 1...11 {
  print("I will pass this course with best mark, because Swift is great!")
}

var N = 10

print("Squares of the N numbers: ")
for i in 1...N {
  print(i*i, terminator: " ")
}

N = 15

print("\nFunny lookin 🐒 wall: ")
for i in 1...N {
  for j in 1...N {
    print("@", terminator: "")
  }
  print()
}

var numbers = [5, 10, 20, 15, 80, 13]

var max = numbers[0]
var reversed = [Int]()

for num  in numbers {
if num > max { max = num }
reversed.append(num)
}

print("\nMax: \(max)")

reversed.reverse()
print("Reversed elements: ")
for r in reversed {
print(r, terminator:", ")
}

var allNumbers = [10, 20, 10, 11, 13, 20, 10, 30]

var exc = [Int]()

for allNum in allNumbers {
    if !(exc.contains(allNum)) { exc.append(allNum) }
}

print("\nExclusive elements: ")
for e in exc {
print(e, terminator:", ")
}
print()

var number = 10
var divisors = Set<Int>()

for i in 1...number {
if number%i == 0 { divisors.insert(i) }
}

print("\nDivisors of number: \(divisors.sorted())\n")

var flights: [[String: String]] = [
[
"flightNumber" : "AA8025",
"destination" : "Copenhagen"
],
[
"flightNumber" : "BA1442",
"destination" : "New York"
],
[
"flightNumber" : "BD6741",
"destination" : "Barcelona"
]
]

var flightNumbers = [String]()

for fl in flights {
    var k: String? = fl["flightNumber"] 
    var out = ""
    if let key = k {
        out = "\(key)"
    } 
    flightNumbers.append(out)
}

print("flightNumbers array: \(flightNumbers)")


var names = ["Hommer","Lisa","Bart"]

var fullName: [[String:String]] = []

for nam in names {
    var tmpName: [String:String] = ["lastName": "Simpson", "firstName": nam]
   fullName.append(tmpName)
}

print("\nSimpons dictionary: \(fullName)")