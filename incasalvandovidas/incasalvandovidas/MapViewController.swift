//
//  MapViewController.swift
//  incasalvandovidas
//
//  Created by Jorge on 3/07/17.
//  Copyright © 2017 inca. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    
    @IBOutlet weak var myMapView: MKMapView!
    @IBOutlet weak var btnReportClose: UIButton!
    let helper = DataContact()
    
    var pin = MKPointAnnotation();
    
    @IBAction func onSend(_ sender: Any) {
    }
    var latitude : Double = 0.0;
    var longitud : Double = 0.0;
    var Fullname : String = ""
    var CellNumber : String = ""
    var Email : String = ""
    
    @IBAction func onClose(_ sender: Any) {
        
        //self.onSend();
        
        //helper.Alert(title : "", msg: "", viewController: self)
        
        let successAction = UIAlertAction(title: "OK", style: .default) { action in
            NSLog("Terminando el app.")
            exit(0);
        }
        helper.Alert(msg: "Gracias por usar nuestro aplicativo", viewController: self, okAction : successAction);
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let center = CLLocationCoordinate2DMake(latitude, longitud)
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let location = MKCoordinateRegion(center: center, span: span)
        myMapView.setRegion(location, animated: true);
        
        pin.coordinate = location.center;
        pin.title = "Tu ubicación actual"
        myMapView.addAnnotation(pin);
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSaveandClose(_ sender: Any) {
        //self.onSend();
    }
    
    func onSend() {
        let helper = DataContact()
        let name = self.Fullname;
        let email = self.Email;
        let cell = self.CellNumber;
        let latitude = self.latitude;
        let longitud = self.longitud;
        
        helper.Insert(Fullname: name, CellNumber: email, Email: cell, Latitud : latitude, Longitud: longitud)
        
        let OkAction = UIAlertAction(title: "CERRAR / CLOSE", style: .cancel) { action in
            self.dismiss(animated: true) {
                print("sallir")
            }
        }
        helper.Alert(msg: "Se ha grabado correctamente su posicionamiento", viewController: self, okAction : OkAction )
        

        btnReportClose.isEnabled = false;
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
