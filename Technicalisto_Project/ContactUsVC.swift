
/// ------------------------------------------
/// By Technicalisto
/// ContactUsVC.swift
/// ------------------------------------------

import UIKit
import MessageUI

class ContactUsVC: UIViewController, MFMailComposeViewControllerDelegate{

    var twitter = "https://twitter.com/"
    var email = "aya@gmail.com"
    var phone = "01000000000"
    var whatsapp = "+2001022855765"


    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
/// ------------------------------------------
/// Email
/// ------------------------------------------
@IBAction func EmailTapped(_ sender: Any) {
                
    let emailTitle = "Technicalisto"
    let image = UIImage(contentsOfFile: Bundle.main.resourcePath! + "/logo.jpg") // Your Image
    let imageData = image!.pngData() ?? nil
    let base64String = imageData?.base64EncodedString() ?? "" // Your String Image
    let messageBody = "<html><body><p>Header: Hello Test Email</p><p><b><img style='width:140px;height:100px;' src='data:image/png;base64,\(String(describing: base64String) )'></b></p></body></html>"

    let toRecipents = [self.email]
            
    let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setSubject(emailTitle)
        mc.setMessageBody(messageBody, isHTML: true)
        mc.setToRecipients(toRecipents)

        self.present(mc, animated: true, completion: nil)
                
}
        

private func mailComposeController(controller:MFMailComposeViewController, didFinishWithResult result:MFMailComposeResult, error:NSError) {
            
    self.dismiss(animated: true, completion: nil)
            
}
    
/// ------------------------------------------
/// Phone Call
/// ------------------------------------------
@IBAction func callTapped(_ sender: Any) {
        
    guard let number = URL(string: "tel://" + (self.phone ) ) else { return }
    
    UIApplication.shared.open(number)
        
}
    
/// ------------------------------------------
/// Whatsapp
/// ------------------------------------------
@IBAction func WhatsappTapped(_ sender: Any) {
        
    let myMessageWantToSendViaWhatsapp = "Hello:Technicalisto" // Note Message must to be without space
        
    let url  = NSURL(string: "whatsapp://send?phone=" + "\(self.whatsapp)" + "&text=" + "\(myMessageWantToSendViaWhatsapp)")
        
    if UIApplication.shared.canOpenURL(url! as URL) {
            // Open Whatsapp
        UIApplication.shared.open(url! as URL, options: [:]){ (success) in
                
        if success {
        print("WhatsApp accessed successfully")
        } else {
        print("Error accessing WhatsApp")
        }
                
    }
}}
    
/// ------------------------------------------
/// Telegram
/// ------------------------------------------
@IBAction func telegramTapped(_ sender: Any) {
        
    let screenName =  self.phone // <<< ONLY CHANGE THIS ID
        
    let appURL = NSURL(string: "tg://resolve?domain=\(screenName)")!
        
    let webURL = NSURL(string: "https://t.me/\(screenName)")!
        
    if UIApplication.shared.canOpenURL(appURL as URL) {
    if #available(iOS 10.0, *) {
        UIApplication.shared.open(appURL as URL, options: [:], completionHandler: nil)
    }
    else {
        UIApplication.shared.openURL(appURL as URL)
    }
    }
    else {
    //redirect to safari because user doesn't have Telegram
    if #available(iOS 10.0, *) {
    UIApplication.shared.open(webURL as URL, options: [:], completionHandler: nil)
    }
    else {
    UIApplication.shared.openURL(webURL as URL)
    }
    }
    }
    

/// ------------------------------------------
/// Twitter Normal Link
/// ------------------------------------------
@IBAction func TwitterTapped(_ sender: Any) {
            
    guard let url = URL(string: self.twitter) else { return }
        
    UIApplication.shared.open(url)
           
}
    
}
