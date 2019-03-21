import UIKit

var str = "Hello, playground"

do {
    let contents = try NSString(contentsOfFile: "myfile.txt", encoding: String.Encoding.utf8.rawValue)
    print(contents)
} catch let error as NSError {
    print(error)
}

enum MyError:Error {
    case NumberIsLower
    case NumberIsGreater
}

func testFun(a:Int) throws {
    if a<=10 {
        throw MyError.NumberIsLower
    } else {
        throw MyError.NumberIsGreater
    }
}

do{
    try testFun(a: 10)
} catch MyError.NumberIsLower {
    print("Numer is lower")
} catch MyError.NumberIsGreater {
    print("Numer is greater")
}
