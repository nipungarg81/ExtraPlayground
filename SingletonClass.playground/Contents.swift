import UIKit

class singletonClass {
    static let getInstance = singletonClass()

    private init() {

    }

    func sum(a:Int, b:Int) -> Int{
        return a+b
    }
}

let nn = singletonClass.getInstance.sum(a: 10, b: 2)
