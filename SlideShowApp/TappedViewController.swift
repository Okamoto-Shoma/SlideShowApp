//
//  TappedViewController.swift
//  SlideShowApp
//
//  Created by 岡本 翔真 on 2020/04/14.
//  Copyright © 2020 shoma.okamoto. All rights reserved.
//

import UIKit

class TappedViewController: UIViewController {
    @IBOutlet weak var tappedimageView: UIImageView!
    
    //var imageView: UIImageView!
    var tappedImage: UIImage!
    var scale: CGFloat = 1.0
    var imageW: CGFloat = 0
    var imageH: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tappedimageView.image = tappedImage
        
        //画像の幅/高さを取得
        imageW = tappedImage.size.width
        imageH = tappedImage.size.height
        //画像を2倍にする
        tappedimageView.transform = CGAffineTransform(scaleX: 3,y: 3)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
