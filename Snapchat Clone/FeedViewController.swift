//
//  FeedViewController.swift
//  Snapchat Clone
//
//  Created by 石济 on 10/15/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return threadNames[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let a = threadNames[section]
        return (threads[a]!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = existFeeds.dequeueReusableCell(withIdentifier: "CustomExistedFeedCell", for: indexPath) as! CustomExistedFeedCell
        let name = threadNames[indexPath.section]
        cell.postTime.text = timePosted[name]![indexPath.item]
        if alreadyReadPosts[name]!.contains(indexPath.item) {
            cell.feedStatus.image = #imageLiteral(resourceName: "unread")
        } else {
            cell.feedStatus.image = #imageLiteral(resourceName: "read")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = threadNames[indexPath.section]
        let snaps: [UIImage] = threads[name]!
        let snap: UIImage = snaps[indexPath.item]
        if !alreadyReadPosts[name]!.contains(indexPath.item) {
            toView = snap
            performSegue(withIdentifier: "feedToView", sender: self)
            alreadyReadPosts[name]?.append(indexPath.item)
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return threadNames.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        existFeeds.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "feedToView" {
                if let dest = segue.destination as? FeedImageController {
                    dest.myImage = self.toView
                }
            }
        }
    }

    @IBOutlet weak var existFeeds: UITableView!
    
    var alreadyRead: [UIImage] = []
    var toView: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        existFeeds.delegate = self
        existFeeds.dataSource = self
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
