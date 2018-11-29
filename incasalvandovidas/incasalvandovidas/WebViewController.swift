//
//  WebViewController.swift
//  incasalvandovidas
//
//  Created by Jorge on 10/08/17.
//  Copyright © 2017 inca. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var WebViewControl: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let localfilePath = Bundle.main.url(forResource: "inca", withExtension: "html");
        let myRequest = NSURLRequest(url: localfilePath!);
        WebViewControl.loadRequest(myRequest as URLRequest);
        
        
        //let urls = NSURL(fileURLWithPath: "index.html")
        //let request = NSURLRequest(URL: NSURL(string: "index.html"))
        //WebViewControl.loadRequest(URLRequest(url: URL(string: "http://www.google.com")!))
        //WebViewControl.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
