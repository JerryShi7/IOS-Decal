//
//  PostViewController.swift
//  Snapchat Clone
//
//  Created by 石济 on 10/15/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class PostViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return threadNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = feedTable.dequeueReusableCell(withIdentifier: "CustomFeedCell", for: indexPath) as! CustomFeedCell
        cell.feedName.text = threadNames[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        feedName.text = "Post to:" + threadNames[indexPath.item]
        selectedFeed = threadNames[indexPath.item]
    }
    
    @IBAction func post(_ sender: Any) {
        threads[selectedFeed!]!.append(selectedImage!)
        feedName.text = "Post Success!"
    }
    
    var selectedImage: UIImage?
    var selectedFeed: String?
    
    @IBOutlet weak var feedTable: UITableView!
    @IBOutlet weak var feedName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedTable.delegate = self
        feedTable.dataSource = self

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
