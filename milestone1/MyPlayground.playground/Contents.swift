import UIKit

let celsius: Double = 25.5

let fahrenheit: Double = (celsius * 9.0 / 5.0) + 32.0

print("\(fahrenheit)°F")
print("\(celsius)°C")

let albums = ["Thriller", "Back in Black", "Purple Rain", "Thriller"]
print("Albums size: \(albums.count)")

let setOfAlbums = Set(albums)
print("Unique albums size: \(setOfAlbums.count)")


for number in 1...100 {
  if(number.isMultiple(of: 3) && number.isMultiple(of: 5)){
    print("FizzBuzz -> number: \(number)\n")
  }else if(number.isMultiple(of: 3)){
    print("Fizz -> number: \(number)\n")
  }else if (number.isMultiple(of: 5)){
    print("Buzz -> number: \(number)\n")
  } else {
     print("Number: \(number)\n")
  }
}

