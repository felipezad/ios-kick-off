import UIKit

let celsius: Double = 25.5

let fahrenheit: Double = (celsius * 9.0 / 5.0) + 32.0

print("\(fahrenheit)°F")
print("\(celsius)°C")

let albums = ["Thriller", "Back in Black", "Purple Rain", "Thriller"]
print("Albums size: \(albums.count)")

let setOfAlbums = Set(albums)
print("Unique albums size: \(setOfAlbums.count)")

