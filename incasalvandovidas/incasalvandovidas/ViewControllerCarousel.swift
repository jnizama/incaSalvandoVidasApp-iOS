//
//  ViewControllerCarousel.swift
//  incasalvandovidas
//
//  Created by Jorge on 6/08/17.
//  Copyright © 2017 inca. All rights reserved.
//

import UIKit

class ViewControllerCarousel: UIViewController, iCarouselDelegate, iCarouselDataSource {

    @IBOutlet var carouselView: iCarousel!
    
    var button = UIButton();
    var selectedIndex = 0;
    
    //var numbers = [Int]();
    var images = NSMutableArray(array: ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg"])

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        carouselView.type = .cylinder;
        carouselView.reloadData();
        
        let screenSize : CGRect = UIScreen.main.bounds;
        
        button = UIButton(frame: CGRect(x: 0, y: (screenSize.height - 80), width : 100, height : 20))
        //button.backgroundColor = UIColor.blue;
        
        //button.frame.size = CGSize(width: 300, height: 20)
        
        //button.origin = CGPoint(x: (((superview?.frame.width)! / 2) - (self.frame.width / 2)), y: self.frame.origin.y)
        
        button.setTitle("Iniciar/Start", for: UIControlState.normal)
        button.setTitleColor(UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0),
                             for: UIControlState.normal)
        
        button.addTarget(self, action: #selector(tabmyButton(sender:)), for: UIControlEvents.touchUpInside)
        self.view.addSubview(button)
    }
    override func awakeFromNib() {
        super.awakeFromNib();
        //numbers = [1,2,3,4,5,6,7];
    }
    func numberOfItems(in carousel: iCarousel) -> Int {
        return images.count;
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: UIImageView
        let screenSize : CGRect = UIScreen.main.bounds;
        
        if (view == nil)
        {
            itemView = UIImageView(frame:CGRect(x:0, y:0, width:screenSize.width - 50 , height:screenSize.height - 50))
            //itemView.contentMode = .scaleToFill
            itemView.contentMode = .scaleAspectFit
        }
        else
        {
            itemView = view as! UIImageView;
        }
        itemView.image = UIImage(named: "\(images.object(at: index))")
        
        
        
        //itemView.addSubview(button)
        
        return itemView;
        
    }
    
    func tabmyButton(sender: UIButton)
    {
        NSLog("OK BUT TON");
        self.performSegue(withIdentifier: "tabbarsegue", sender: nil)
        
    }
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if option  == iCarouselOption.spacing {
                return value * 1.2
            }
        return value;
    }
    func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
        selectedIndex = index
        //self .performSegue(withIdentifier: "imageDisplaySegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "tabbarsegue")
//        {
//            //var viewController : ViewController = segue.destination as! ViewController
//            self.performSegue(withIdentifier: "tabbarsegue", sender: nil)
//            //viewController.selectedImage = UIImage(named: "\(images.objectAtIndex(selectedIndex))")
//        }
        
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
