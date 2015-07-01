//
//  ViewController.swift
//  testAV
//
//  Created by nixinyu on 15/6/28.
//  Copyright (c) 2015年 nixinyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var playButton:UIButton?
    var player = SinePlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupActionButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupActionButton(){
        playButton = UIButton()
        playButton!.backgroundColor = UIColor.blueColor()
        playButton!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        playButton!.setTitleColor(UIColor.blackColor(), forState: UIControlState.Highlighted)
        playButton!.setTitle("play", forState: UIControlState.Normal)
        playButton!.addTarget(self, action: "playButtonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(playButton!)
    }
    
    override func viewWillLayoutSubviews() {
        let bwidth: CGFloat = 150
        let bheight: CGFloat = 60
        super.viewWillLayoutSubviews()
        playButton!.frame = CGRectMake(self.view.bounds.size.width/2-bwidth/2, self.view.bounds.size.height/2-bheight/2, bwidth, bheight)
    }
    
    func playButtonTapped(sender:UIButton){
        //player.test()
        player.playAV()
    }

}

