//
//  ViewController.swift
//  incasalvandovidas
//
//  Created by Jorge on 5/05/17.
//  Copyright © 2017 inca. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    let helper = DataContact()
    
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtMovil: UITextField!
    @IBOutlet weak var btnSend: UIButton!
    
    var latitude : Double = 0.0;
    var longitud : Double = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        self.locationManager.distanceFilter = 100
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation();
//
        helper.makeBorderButton(button: btnSend);
        //helper.makeTrasparentButton(button: btnSend);
        
    }
    override func viewWillAppear(_ animated: Bool) {
        txtFullName.text = "";
        txtEmail.text = "";
        txtMovil.text = "";
        
    }
    // MARK: - Convenience
   
    deinit {
        self.locationManager.stopUpdatingLocation();
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //last localization monitorized
        let newLocation = locations[locations.count-1] as CLLocation;
        latitude = newLocation.coordinate.latitude;
        longitud = newLocation.coordinate.longitude;
        
        print("latidud is: \(latitude) and longitude is: \(longitud)");
    }
    @IBAction func onSend(_ sender: Any) {
        let helper = DataContact()
        let name = txtFullName.text;
        let email = txtEmail.text;
        let cell = txtMovil.text;
        
        helper.Insert(Fullname: name!, CellNumber: email!, Email: cell!, Latitud : latitude, Longitud: longitud)
        let successAction = UIAlertAction(title: "OK", style: .default) { action in
//            NSLog("Successfull.")
//            var viewController : ViewController = segue.destination as! ViewController
//            self.performSegue(withIdentifier: "tabbarsegue", sender: nil)
            self.performSegue(withIdentifier: "showmapsegue", sender: self)
        }
        helper.Alert(msg: "Se ha grabado correctamente su posicionamiento", viewController: self, okAction : successAction);
        
        btnSend.isEnabled = false;
    }
//    @IBAction func onSend(_ sender: Any) {
//        let helper = DataContact()
//        let name = txtFullName.text;
//        let email = txtEmail.text;
//        let cell = txtMovil.text;
//        
//        helper.Insert(Fullname: name!, CellNumber: email!, Email: cell!, Latitud : latitude, Longitud: longitud)
//        helper.Alert(msg: "Se ha grabado correctamente su posicionamiento", viewController: self)
//        
//        btnSend.isEnabled = false;
//        
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let mapView = segue.destination as! MapViewController;
        mapView.longitud = self.longitud;
        mapView.latitude = self.latitude;
        mapView.Fullname = self.txtFullName.text!
        mapView.Email = self.txtFullName.text!
        mapView.CellNumber = self.txtFullName.text!
    }
    @IBAction func textFieldEndEditing(TextEdit : UITextField)
    {
        TextEdit.resignFirstResponder();
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let name = txtFullName.text;
        let email = txtEmail.text;
        let cell = txtMovil.text;
        
        if(name == "")
        {
            helper.Alert(title : "Validación", msg: "Debe ingresar nombre completo", viewController: self)
            return false;
        }
        if(email == "")
        {
            helper.Alert(title : "Validación", msg: "Debe ingresar correo electrónico", viewController: self)
            return false;
        }
        if(cell == "")
        {
            helper.Alert(title : "Validación", msg: "Debe ingresar celular", viewController: self)
            return false;
        }
        
        return true;
    }
    @IBAction func lostKewboardOnView(sender: UIControl)
    {
        txtFullName.resignFirstResponder();
        txtEmail.resignFirstResponder();
        txtMovil.resignFirstResponder();
    }
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    // MARK: - UIWebViewDelegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    // MARK: - Configuration
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

