//
//  FeedImageController.swift
//  Snapchat Clone
//
//  Created by 石济 on 10/15/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedImageController: UIViewController {

    @IBOutlet weak var feedImage: UIImageView!
    var myImage: UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        feedImage.image = myImage
        // Do any additional setup after loading the view.
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
