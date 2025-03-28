import UIKit

let celsius: Double = 25.5

let fahrenheit: Double = (celsius * 9.0 / 5.0) + 32.0

print("\(fahrenheit)°F")
print("\(celsius)°C")

let albums = ["Thriller", "Back in Black", "Purple Rain", "Thriller"]
print("Albums size: \(albums.count)")

let setOfAlbums = Set(albums)
print("Unique albums size: \(setOfAlbums.count)")


//for number in 1...100 {
//  if(number.isMultiple(of: 3) && number.isMultiple(of: 5)){
//    print("FizzBuzz -> number: \(number)\n")
//  }else if(number.isMultiple(of: 3)){
//    print("Fizz -> number: \(number)\n")
//  }else if (number.isMultiple(of: 5)){
//    print("Buzz -> number: \(number)\n")
//  } else {
//     print("Number: \(number)\n")
//  }
//}

enum CustomError : Error {
  case OutOfBoundsExcpetion
  case NotInteger
}
func findSqrtRoot(_ number: Int){
  do {
    if(number < 1 || number > 10000){
      throw CustomError.OutOfBoundsExcpetion
    }
    let result = sqrt(Double(number))
    if(result.truncatingRemainder(dividingBy: 1) != 0){
      throw CustomError.NotInteger
    }
    
    print("Sqrt root of \(number) is: \(result)")
  } catch {
    print("Error: \(error)")
  }
}

findSqrtRoot(1000)


let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]


print(luckyNumbers.filter { $0 % 2 != 0}.sorted().map { "\($0) is a lucky number!"})


struct Car {
  let model: String
  let numberOfSeats: Int
  private var currentGear: Int {
    didSet {
      print("The gear now is \(currentGear)")
    }
    willSet {
      print("Current gear is \(currentGear)")
      print("The gear will be \(newValue)")
    }
  }
  
  
  init(model: String, numberOfSeats: Int, currentGear: Int) {
    self.model = model
    self.numberOfSeats = numberOfSeats
    self.currentGear = currentGear
  }
  
  mutating func changeGear(_ newGear: Int) {
    currentGear = newGear
  }
}

var car = Car(model: "XYZ", numberOfSeats: 6, currentGear: 1)
car.changeGear(2)

class Animal {
  let legs : Int
  
  init(_ legs: Int) {
    self.legs = legs
  }
}

class Dog : Animal {
  override init(_ legs: Int) {
    super.init(legs)
  }
  
  func speak(){
    print("Dog speak")
  }
}

class Corgi : Dog {
  override init(_ legs: Int) {
    super.init(legs)
  }
  override func speak() {
    print("corgi speak")
  }
}

class Poodle : Dog {
  override init(_ legs: Int) {
    super.init(legs)
  }
  
  override func speak() {
    print("poddle speak")
  }
}

class Cat : Animal {
  override init(_ legs: Int) {
    super.init(legs)
  }
  func speak(){
    print("Cat speak")
  }
}

class Persian : Cat {
  override init(_ legs: Int) {
    super.init(legs)
  }
  
  override func speak() {
    print("Persian speak")
  }
}

class Lion : Cat {
  
  override init(_ legs: Int) {
    super.init(legs)
  }
  override func speak() {
    print("Lion speak")
  }
}

print(
  Lion(4).speak()
)

print(
  Corgi(4).speak()
)


protocol Building {
  var room: Int { get set  }
  var name: String {get}
  var year: Int {get}
  var cost: Double {get}
}

struct Home : Building {
  var room: Int
  var name: String
  var year: Int
  var cost: Double
  
  init(room: Int, name: String, year: Int, cost: Double) {
    self.room = room
    self.name = name
    self.year = year
    self.cost = cost
  }
  
}

struct Office : Building {
  var room: Int
  
  var name: String
  
  var year: Int
  
  var cost: Double
  
  init(room: Int, name: String, year: Int, cost: Double) {
    self.room = room
    self.name = name
    self.year = year
    self.cost = cost
  }
}

extension Building {
  func summary()  {
    print("Building Info: \(self.cost) + \(self.room) + \(self.name) + \(self.year)")
  }
  
  mutating func addRoom(_ num: Int)  {
    self.room += num
  }
}

extension Home {
  init(name : String, year : Int, cost : Double){
    self.room = 0
    self.name = name
    self.year = year
    self.cost = cost
  }
}

var myHome: Home = Home(name: "MyHome", year: 2021, cost: 100000)
myHome.summary()
myHome.addRoom(10)
myHome.summary()

var myOffice: Office = Office(room: 10, name: "MyOffice", year: 2021, cost: 100000)
myOffice.summary()
myOffice.addRoom(10)
myOffice.summary()



func test(from numbers : [Int]? ) -> Int {
  return  numbers?.randomElement() ??  Int.random(in: 1...100)
}

let response = test(from: [1,2,3,4,5])

print("Response is: \(response)" )
print("Response is: \(test(from: nil))" )



// Create CLI programm with SOLID

protocol Human {
  var name : String { get }
  
  static var starSigns: [String] { get }
}

protocol Generation {

  func talkAboutYourSelf()
  
  func checkStarSign(star sign: String?)
  
  init(name: String) // Add initializer

}

struct Millenium : Human, Generation {
  
  var name: String

  
  func talkAboutYourSelf() {
    print("What's your star sign?")
  }
  
  func checkStarSign(star sign: String?) {
    guard let sign  = sign else {
      print("No star sign! Are you even a human?")
      return
    }
    
    if(Millenium.starSigns.contains(sign)){
      print("\(sign) is a valid star sign"  )
    } else {
      print( "Oh no you are not millenium")
    }
    
  }
  init(name: String) {
    self.name = name
  }
}

struct GenerationZ : Human, Generation {
  func checkStarSign(star sign: String?) {
    if let unwrappedSign = sign {
      print("A real genZ doesn't have a star sign, you fake!")
    }else {
      print("I don't care about that")
    }
  }
  
  var name: String
  
  func talkAboutYourSelf() {
    print("Wanna smoke with Me? ")
  }
  
  init(name: String) {
    self.name = name
  }
}

struct Boomer : Human, Generation {
  var name: String
  
  func checkStarSign(star sign: String?) {
    print("In my times things were harder...")
  }
  
  init(name: String) {
    self.name = name
  }
}

extension Generation {
  func talkAboutYourSelf(){
    print("Let's not engage in this topic")
  }
}

extension Human {
    static var starSigns: [String] {
        return [
            "Aries",       // March 21 - April 19
            "Taurus",      // April 20 - May 20
            "Gemini",      // May 21 - June 20
            "Cancer",      // June 21 - July 22
            "Leo",         // July 23 - August 22
            "Virgo",       // August 23 - September 22
            "Libra",       // September 23 - October 22
            "Scorpio",     // October 23 - November 21
            "Sagittarius", // November 22 - December 21
            "Capricorn",   // December 22 - January 19
            "Aquarius",    // January 20 - February 18
            "Pisces"       // February 19 - March 20
        ]
    }
}

class PersonFactory {
  static func createPerson<T: Generation>(type: T.Type, name: String) -> T {
      return type.init(name: name)
  }
}


class Main {
  
  func execute(){

    print("=========================================")
    print("Welcome to the generation factory program!")
    print("=========================================")
    
    // Valid user-defined input
    let millenium = PersonFactory.createPerson(type: Millenium.self, name: "Mary")
    let genz = PersonFactory.createPerson(type: GenerationZ.self, name: "John")
    let boomer = PersonFactory.createPerson(type: Boomer.self, name: "Mike")
    
    // Interact with each person
    doSomething(person: millenium)
    millenium.checkStarSign(star: nil)
    millenium.checkStarSign(star: "Aquarius")
    
    print("=========================================")
    doSomething(person: genz)
    genz.checkStarSign(star: nil)
    genz.checkStarSign(star: "Aquarius")
    
    print("=========================================")
    doSomething(person: boomer)
    boomer.checkStarSign(star: nil)
    boomer.checkStarSign(star: "Aquarius")
  }
  
  private func doSomething(person : Generation){
    print("This \(person) is doing something")
    person.talkAboutYourSelf()
  }
}

Main().execute()
