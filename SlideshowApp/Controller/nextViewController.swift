//
//  nextViewController.swift
//  SlideshowApp
//
//  Created by 木村旭 on 2020/01/03.
//  Copyright © 2020 asahi.kimura. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {
    
    let pictureArray = ["0","1","2","3","4"]
    var count = 0
    var timer: Timer!
    @IBOutlet weak var largeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
             }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        largeImageView.image = UIImage(named: "\(pictureArray[count]).jpg")
    }
        

    

}
