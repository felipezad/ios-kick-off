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

