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
