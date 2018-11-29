//
//  Helper.swift
//  incasalvandovidas
//
//  Created by Jorge on 2/07/17.
//  Copyright © 2017 inca. All rights reserved.
//

import Foundation
import UIKit

class DataContact{
    func Insert(Fullname : String, CellNumber : String, Email : String, Latitud : Double, Longitud : Double)
    {
        //let myUrl = NSURL(string: "http://apps.inca.org.pe/demo.php");
        
        let _url = URL(string: "http://apps.inca.org.pe/insert.php");
        
        var request = URLRequest(url: _url!)
        request.httpMethod = "POST"
        
        let postString = "firstName=\(Fullname)&cellphone=\(CellNumber)&email=\(Email)&latitude=\(Latitud)&longitude=\(Longitud)"
        
        request.httpBody = postString.data(using: .utf8)
        
        let http = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print("error=\(error!)")
                return
            }
            
            print("response = \(response!)")
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString!)")
            
        }
        
        http.resume()
    }
    func Alert(title : String, msg: String, viewController : UIViewController){
        let alert = UIAlertController(title: title, message : msg, preferredStyle: .alert)
        //let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        alert.addAction(cancelAction)
        viewController.present(alert, animated: true, completion: nil);
    }
    func Alert(msg: String, viewController : UIViewController, okAction : UIAlertAction){
        let alert = UIAlertController(title: "Notificación de su posicionamiento", message : msg, preferredStyle: .alert)
        //let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil);
    }
    func makeBorderButton(button: UIButton){
        //btnSend.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
    }
    func makeTrasparentButton(button: UIButton)
    {
        let borderAlpha : CGFloat = 0.7
        let cornerRadius : CGFloat = 5.0
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        //button.setTitle("Get Started", for: UIControlState.Normal)
        button.setTitle("--", for: UIControlState.focused)
        
        button.setTitleColor(UIColor.white, for: UIControlState.normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor(white: 1.0, alpha: borderAlpha).cgColor
        button.layer.cornerRadius = cornerRadius
    }
}
