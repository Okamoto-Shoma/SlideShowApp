//
//  ViewController.swift
//  SlideShowApp
//
//  Created by 岡本 翔真 on 2020/04/14.
//  Copyright © 2020 shoma.okamoto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slideshowimage: UIImageView!
    @IBOutlet weak var nextbutton: UIButton!
    @IBOutlet weak var backbutton: UIButton!
    @IBOutlet weak var startstopbutton: UIButton!
    
    let images: [UIImage?] = [UIImage(named: "miku.jpg"), UIImage(named: "shils.jpg"), UIImage(named: "eva1.jpg"), UIImage(named: "shils.jpg")]
    //タイマー
    var timer: Timer!
    //タイマー用の時間のための変数
    var timer_sec: Float = 0
    //最初の画像の選択
    var imageIndex = 0
    //再生中か判断するため
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        slideshowimage.image = images[imageIndex]
    }
    
    /// 画像をタップ
    /// - Parameter sender: 次ページに遷移
    @IBAction func tappedAction(_ sender: Any) {
        //タイマーを停止
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
            startstopbutton.setTitle("再生", for: .normal)
        }
        flag = false
        backbutton.isEnabled = !self.flag
        nextbutton.isEnabled = !self.flag
        
        self.performSegue(withIdentifier: "SegueToTapped", sender: images)
    }
    /// 最初のページに戻る
    /// - Parameter segue: 前ページに遷移
    @IBAction func backtopage(_ segue: UIStoryboardSegue){
    }
    /// 進むボタン
    /// - Parameter _sender: 次の画像に変更
    @IBAction func nextbutton(_sender: Any) {
        if imageIndex == 2 {
            imageIndex = 0
        } else {
            imageIndex += 1
        }
        slideshowimage.image = images[imageIndex]
    }
    /// 戻るボタン
    /// - Parameter sender: 一枚前の画像に変更
    @IBAction func backbuttonAction(_ sender: Any) {
        if imageIndex == 0 {
            imageIndex = 2
        } else {
            imageIndex -= 1
        }
        slideshowimage.image = images[imageIndex]
    }
    
    /// 再生/停止ボタン
    /// - Parameter sender: スライドショーの開始/停止処理
    @IBAction func startstopbuttonAction(_ sender: Any) {
        if flag == false {
            //ボタンを押すとタイマー作成、始動
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                startstopbutton.setTitle("停止", for: .normal)
            }
            flag = true
        } else {
            //タイマーを停止
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
                startstopbutton.setTitle("再生", for: .normal)
            }
            flag = false
        }
        backbutton.isEnabled = !self.flag
        nextbutton.isEnabled = !self.flag
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tappedViewControlle:TappedViewController = segue.destination as! TappedViewController
        tappedViewControlle.tappedImage = slideshowimage.image
        }
    
    //selector: #selector(updatetimer(_:))で指定された関数
    //timeInterval: 1, repeats: trueで指定された通り、1秒毎に呼び出され続ける
    @objc func updateTimer(_ timer: Timer) {
        self.timer_sec += 1
        if imageIndex == self.images.count - 1 {
            imageIndex = 0
        }else {
            imageIndex += 1
        }
        slideshowimage.image = images[imageIndex]
    }
}

