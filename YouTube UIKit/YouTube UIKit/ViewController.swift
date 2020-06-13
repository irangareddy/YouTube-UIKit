//
//  ViewController.swift
//  YouTube UIKit
//
//  Created by RANGA REDDY NUKALA on 13/06/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        model.delegate = self
        model.getVideos()
    }
    
    

}

// MARK:- UITableViewDataSource


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath)
        
        let title = self.videos[indexPath.row].title
        
        cell.textLabel?.text = title
        
        return cell
        
    }
    
    
}

// MARK:- UITableViewDelegate


extension ViewController: UITableViewDelegate {
    
}


extension ViewController: ModelDelegate {
    

    
    func videosFetched(_ videos: [Video]) {
        
        //    set the returned videos to our video property
        
        self.videos = videos
        
        // Refresh the tableViewData
        
        tableView.reloadData()
    }
    
    
    
    
}
