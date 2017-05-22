import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    
    func dismissKeyboard() {
        username.resignFirstResponder()
        password.resignFirstResponder()
    }
    
    func pulseLoginButton() {
        UIView.animate(
            withDuration: 0.6,
            animations: { self.login.transform = CGAffineTransform(scaleX: 1.6, y: 1.4) },
            completion: { _ in UIView.animate(withDuration: 0.6,
                                              animations: { self.login.transform = CGAffineTransform.identity })
                        }
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self
        pulseLoginButton()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func login(_ sender: Any) {
        dismissKeyboard()
    }
    
    @IBAction func tappedBackground(_ sender: Any) {
        dismissKeyboard()
    }
}
