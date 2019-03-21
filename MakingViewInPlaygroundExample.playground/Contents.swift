import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    var view1:UIView = {
        let view = UIView.init(frame: CGRect(x:100, y:10,width: 20,height:100))
        view.backgroundColor = UIColor.red
        return view
    }()
    var view2:UIView = {
        let view = UIView.init(frame: CGRect(x:140,y:10,width:20,height:80))
        view.backgroundColor = UIColor.green
        return view
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.gray
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        addGesture(view: view1)
    }
    
    func addGesture(view: UIView) {
        let pan = UIPanGestureRecognizer(target: self, action: #selector(MyViewController.handleMove(sender:)))
        view.addGestureRecognizer(pan)
    }
    
    @objc func handleMove(sender: UIPanGestureRecognizer) {
        if let view = sender.view {
            switch sender.state {
            case .began, .changed:
                let translation = sender.translation(in: view)
                view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
                sender.setTranslation(CGPoint.zero, in: view)
                
                let distance = getDistance(view1Frame: view1.frame, view2Frame: view2.frame)
                if distance <= 10 {
                    view2.center = CGPoint(x: view2.center.x+translation.x, y: view2.center.y+translation.y)
                }
                
                break
            default:
                break
            }
        }
    }
    
    func getDistance(view1Frame: CGRect, view2Frame: CGRect) -> Int {
        
        return Int(view1Frame.width + view1Frame.minX - view2Frame.minX)
    }
}

PlaygroundPage.current.liveView = MyViewController()
