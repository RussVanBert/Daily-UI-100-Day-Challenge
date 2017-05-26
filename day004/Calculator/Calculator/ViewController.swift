import UIKit

class ViewController: UIViewController {
    
    var left = 0.0
    var right = 0.0
    var applicative = ""
    
    @IBOutlet weak var output: UITextView!
    
    @IBAction func button0(_ sender: Any) {
        updateAmount(0)
    }
    
    @IBAction func button1(_ sender: Any) {
//        updateText(".")
    }

    @IBAction func button2(_ sender: Any) {
        apply("=")
    }
    
    @IBAction func button3(_ sender: Any) {
        apply("+")
    }
    
    @IBAction func button4(_ sender: Any) {
        updateAmount(1)
    }
    
    @IBAction func button5(_ sender: Any) {
        updateAmount(2)
    }
    
    @IBAction func button6(_ sender: Any) {
        updateAmount(3)
    }
    
    @IBAction func button7(_ sender: Any) {
        apply("-")
    }
    
    @IBAction func button8(_ sender: Any) {
        updateAmount(4)
    }
    
    @IBAction func button9(_ sender: Any) {
        updateAmount(5)
    }
    
    @IBAction func button10(_ sender: Any) {
        updateAmount(6)
    }
    
    @IBAction func button11(_ sender: Any) {
        apply("x")
    }
    
    @IBAction func button12(_ sender: Any) {
        updateAmount(7)
    }
    
    @IBAction func button13(_ sender: Any) {
        updateAmount(8)
    }
    
    @IBAction func button14(_ sender: Any) {
        updateAmount(9)
    }
    
    @IBAction func button15(_ sender: Any) {
        apply("/")
    }
    
    @IBAction func clear(_ sender: Any) {
        if right != 0.0 {
            right = 0.0
        } else {
            left = 0.0
        }
        updateAmount(0)
    }
    @IBAction func memoryClear(_ sender: Any) {
        right = 0.0
        left = 0.0
        updateAmount(0)
    }
    
    func updateText(_ s : Double) {
        output.text = "\(s)"
    }
    
    func updateAmount(_ a : Double) {
        if applicative == "" {
            left *= 10
            left += a
            updateText(left)
        } else {
            right *= 10
            right += a
            updateText(right)
        }
    }
    
    func apply(_ s : String) {
        guard s == "=" else { applicative = s; return }
        
        switch applicative {
        case "/":
            left /= right
        case "x":
            left *= right
        case "-":
            left -= right
        default:
            left += right
        }
        right = 0.0
        updateText(left)
        applicative = ""
    }
}
