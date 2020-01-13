//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 木村旭 on 2020/01/02.
//  Copyright © 2020 asahi.kimura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer!
    //写真
    let pictureArray = ["0","1","2","3","4"]
    var count = 0
    //再生、一時停止ボタン画像
    let playOrStopArray = ["iconfinder_youtube_1632538","106221-16"]
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var changeImageVIew: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期画像
        changeImageVIew.image = UIImage(named: "\(pictureArray[0]).jpg")
        //初期ボタン
        let image = UIImage(named: "\(playOrStopArray[0]).jpg")
        let state = UIControl.State.normal
        playButton.setImage(image, for: state)
    }

    @IBAction func nextAction(_ sender: Any) {
        count += 1
        if count == 5{
            count = 0
        }
        changeImageVIew.image = UIImage(named: "\(pictureArray[count]).jpg")
    }
    @IBAction func backAction(_ sender: Any) {
        count -= 1
         if count == -1{
             count = 4
         }
         changeImageVIew.image = UIImage(named: "\(pictureArray[count]).jpg")
    }
    @IBAction func playAction(_ sender: Any) {
        //timerが作動していない時
        if timer == nil {
            //2秒毎に画像を変更
            timer =  Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage(_:)), userInfo: nil, repeats: true)
            //next及びbackボタンが使用不可。
            nextButton.isEnabled = false
            backButton.isEnabled = false
            //再生ボタンを一時停止ボタンに変更
            let image = UIImage(named: "\(playOrStopArray[1]).jpg")
            let state = UIControl.State.normal
            playButton.setImage(image, for: state)
            
        //timerがnilじゃない時
        } else if timer != nil {
            
            //一時停止
            timer.invalidate()
            //一時停止ボタンを再生ボタンに変更
            let image = UIImage(named: "\(playOrStopArray[0]).jpg")
            let state = UIControl.State.normal
            playButton.setImage(image, for: state)
            //next及びbackボタンが使用可能。
            nextButton.isEnabled = true
            backButton.isEnabled = true
            //timerの初期化
            timer = nil
        }
    }
    
    //画像変換用のメソッド
    @objc func changeImage(_ timer: Timer){
        count += 1
        if count == 5 {
            count = 0
        }
        changeImageVIew.image = UIImage(named: "\(pictureArray[count]).jpg")
    }
    
    //画面遷移元
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
    
    //画像タップ時の遷移
    @IBAction func nextButton(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! nextViewController
        nextVC.count = count
        if nextButton.isEnabled == false && backButton.isEnabled == false {
                timer.invalidate()
                //一時停止ボタンを再生ボタンに変更
                let image = UIImage(named: "\(playOrStopArray[0]).jpg")
                let state = UIControl.State.normal
                playButton.setImage(image, for: state)
                //next及びbackボタンが使用可能。
                nextButton.isEnabled = true
                backButton.isEnabled = true
                timer = nil
        }
    }
    
}
