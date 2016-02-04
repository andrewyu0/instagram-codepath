//
//  ViewController.swift
//  instagram-codepath
//
//  Created by Andrew Yu on 2/3/16.
//  Copyright © 2016 Andrew Yu. All rights reserved.
//

import UIKit
import AFNetworking

class PhotosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var photosTableView: UITableView!
    var images: [NSDictionary]?
    
    func fetch() {
        
        let clientId = "e05c462ebd86446ea48a5af73769b602"
        let url = NSURL(string:"https://api.instagram.com/v1/media/popular?client_id=\(clientId)")
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession(
            configuration: NSURLSessionConfiguration.defaultSessionConfiguration(),
            delegate:nil,
            delegateQueue:NSOperationQueue.mainQueue()
        )
        
        let task : NSURLSessionDataTask = session.dataTaskWithRequest(request,
            completionHandler: { (dataOrNil, response, error) in
                if let data = dataOrNil {
                    if let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(
                        data, options:[]) as? NSDictionary {
                            NSLog("response: \(responseDictionary)")
                            self.images = responseDictionary["data"] as? [NSDictionary]

                            print(self.images)
                            self.photosTableView.reloadData()
                    }
                }
        });
        task.resume()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        photosTableView.dataSource = self
        photosTableView.delegate = self
        
        photosTableView.rowHeight = 320
        // Do any additional setup after loading the view, typically from a nib.
        
        fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let images = images {
            return images.count
        }
            // Case for nil
        else {
            return 0
        }

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCellWithIdentifier("InstaViewCell", forIndexPath: indexPath) as! InstaViewCell
        
        
        let image    = images![indexPath.row]
        
        
        if let imagePath = image["images"]!["standard_resolution"]!!["url"] as? String {
            let imageUrl = NSURL(string: imagePath)
            print(imageUrl)
            // MovieCell properties now available
            cell.instaView.setImageWithURL(imageUrl!)
        }
        
        
        print("row \(indexPath.row)")
        return cell
        
        

    }


}







