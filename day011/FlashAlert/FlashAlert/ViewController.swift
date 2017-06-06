import UIKit

class ViewController: UIViewController {
    @IBAction func correct(_ sender: Any) {
        Toast.showPositiveMessage("That's great!")
    }
    
    @IBAction func incorrect(_ sender: Any) {
        Toast.showNegativeMessage("Oh no! Try again.")
    }
}
