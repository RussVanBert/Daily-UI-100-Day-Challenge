import UIKit

class Toast
{
    class private func showAlert(backgroundColor: UIColor, textColor: UIColor, message: String)
    {
        
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let label = createLabel(backgroundColor, textColor, message, appDelegate.window!.frame.size.width)
        appDelegate.window!.addSubview(label)
        
        var basketTopFrame: CGRect = label.frame;
        basketTopFrame.origin.x = 0;
        
        animateView(label, basketTopFrame)
    }
    
    class func showPositiveMessage(_ message:String)
    {
        let greenish = UIColor(red: 0.56, green: 0.71, blue: 0.42, alpha: 1.0)
        showAlert(backgroundColor: greenish, textColor: UIColor.white, message: message)
    }
    
    class func showNegativeMessage(_ message:String)
    {
        let redish = UIColor(red: 0.72, green: 0.27, blue: 0.21, alpha: 1.0)
        showAlert(backgroundColor: redish, textColor: UIColor.white, message: message)
    }
    
    class func createLabel(_ backgroundColor: UIColor, _ textColor: UIColor, _ message: String, _ width: CGFloat) -> UILabel {
        let label = UILabel()
        label.textAlignment = NSTextAlignment.center
        label.text = message
        label.font = UIFont(name: "", size: 15)
        label.adjustsFontSizeToFitWidth = true
        label.backgroundColor =  backgroundColor
        label.textColor = textColor
        label.sizeToFit()
        label.numberOfLines = 4
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 4, height: 3)
        label.layer.shadowOpacity = 0.3
        label.alpha = 1
        label.frame = CGRect(x: width, y: 64, width: width, height: 44)
        return label
    }
    
    class func animateView(_ label: UILabel, _ frame: CGRect) {
        UIView.animate(withDuration:1.0,
                       delay: 0.0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.6,
                       options: UIViewAnimationOptions.curveEaseOut,
                       animations: { () -> Void in label.frame = frame },
                       completion: { (value: Bool) in UIView.animate(withDuration:2.0,
                                                                     delay: 2.0,
                                                                     usingSpringWithDamping: 0.5,
                                                                     initialSpringVelocity: 0.6,
                                                                     options: UIViewAnimationOptions.curveEaseIn,
                                                                     animations: { () -> Void in label.alpha = 0 },
                                                                     completion: { (value: Bool) in label.removeFromSuperview()
                       })
        })

    }
}
