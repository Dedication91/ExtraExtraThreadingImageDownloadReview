//
//  ViewController.swift
//  ExtraExtraThreadingImageDownloadReview
//
//  Created by Shaan Mirchandani
//  Copyright © 2017 Shaan Mirchandani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    let url = URL(string: "https://fthmb.tqn.com/u5DQpLTI1KGFjP_NXJhRsncBfqQ=/2129x1410/filters:fill(auto,1)/about/dv1915641-56a483c33df78cf77282cac6.jpg")
        
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if (error != nil) {
                print("ERROR")
            }
            else {
                var documentsDirectory:String?
                var paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                
                if paths.count > 0 {
                    documentsDirectory = paths[0]
                    
                    let savePath = documentsDirectory! + "/dv1915641-56a483c33df78cf77282cac6.jpg"
                    
                    FileManager.default.createFile(atPath: savePath, contents: data, attributes: nil)
                    
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(named: savePath)
                    }
                }
            }
        }
        
        task.resume()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

