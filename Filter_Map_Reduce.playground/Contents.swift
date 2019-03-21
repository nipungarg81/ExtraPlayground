import UIKit

var str = "Hello, playground"

//[1, 2, 3, 4, 5].reduce([Int](), combine: { [$1] + $0 })

[1, 2, 3, 4].reduce([]) {
    print("\($0) \([$1]) \([$1] + $0)")
    return [$1] + $0
}

//[1, 2, 3, 4].reduce(1) { $0 % 2 }

print([1,2,3,4].filter { $0 % 2 == 0 })

print([1, 2, 5, 5, 9, 7, 1, 7].reduce([]) { (a:[Int], b:Int) -> [Int] in
    if a.contains(b) {
        return a
    } else {
        return a + [b]
    }
})

print([1, 2, 3, 4].map { (a) -> String in
    String(a)
})

print([1, 2, 3, 4].reduce("") { (a:String, b:Int) -> String in
    return "\(a) \(String(b))"
})



