import UIKit

class ViewController: UIViewController {
    var box: UIView?
    
    lazy var animator: UIDynamicAnimator = {
        return UIDynamicAnimator(referenceView: self.view)
    }()
    
    lazy var gravity:UIGravityBehavior = {
        let lazyGravity = UIGravityBehavior()
        return lazyGravity
    }()
    
    lazy var collider:UICollisionBehavior = {
        let lazyCollider = UICollisionBehavior()
        // This line, makes the boundries of our reference view a boundary
        // for the added items to collide with.
        lazyCollider.translatesReferenceBoundsIntoBoundary = true
        return lazyCollider
    }()
    
    func addBox(location: CGRect) {
        let bundlePath = Bundle.main.path(forResource: "covfefe", ofType: "png")
        let image = UIImage(contentsOfFile: bundlePath!)
        let newBox = UIImageView(frame: location)
        newBox.image = image
        newBox.backgroundColor = .red
        
        view.insertSubview(newBox, at: 0)
        box = newBox
    }
    
    func animateSquare(){
        animator.addBehavior(gravity)
        animator.addBehavior(collider)

        gravity.addItem(box!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addBox(location: CGRect(x: 100, y: 100, width: 300, height: 105))
        animateSquare()
        addBox(location: CGRect(x: 85, y: 390, width: 300, height: 105))
        addBox(location: CGRect(x: 15, y: 15, width: 300, height: 105))
        addBox(location: CGRect(x: 85, y: 40, width: 300, height: 105))
        addBox(location: CGRect(x: 45, y: 290, width: 300, height: 105))
        addBox(location: CGRect(x: 180, y: 490, width: 300, height: 105))
        addBox(location: CGRect(x: -45, y: 130, width: 300, height: 105))
        addBox(location: CGRect(x: 10, y: 550, width: 300, height: 105))
    }
}

