import UIKit

var str = "Hello, playground"

func getData() {
    let url = URL(string: "https://api.myjson.com/bins/vi56v")
    let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
        
        guard error == nil else {
            print("error")
            return
        }
        
        guard let content = data else {
            print("not returning data")
            return
        }
        
        guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
            print("Not containing JSON")
            return
        }
        
        if let array = json["companies"] as? [String] {
            print(array)
        }
        
        DispatchQueue.main.async {
            //update ui
        }
    }
    task.resume()
}

getData()
