import UIKit

var str = "Hello, playground"

enum TeslaError: Error {
    case BatteryLow
    case GPSLost
}


let lostGPS:Bool = true
let lowBattery:Bool = false

func autoDriveTesla() throws {
    if lostGPS {
        throw TeslaError.GPSLost
    }
    if lowBattery {
        throw TeslaError.BatteryLow
    }
}

do {
    try autoDriveTesla()
} catch TeslaError.BatteryLow{
    
} catch TeslaError.GPSLost {
    
}

