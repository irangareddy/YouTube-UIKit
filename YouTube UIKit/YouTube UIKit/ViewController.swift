//
//  ViewController.swift
//  YouTube UIKit
//
//  Created by RANGA REDDY NUKALA on 13/06/20.
//  Copyright © 2020 RANGA REDDY NUKALA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }


}

