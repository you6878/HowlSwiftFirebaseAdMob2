//
//  ViewController.swift
//  howladmob
//
//  Created by 유명식 on 2017. 7. 27..
//  Copyright © 2017년 swift. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, GADRewardBasedVideoAdDelegate {
    var bannerView: GADBannerView!
    var interstitial: GADInterstitial!
    
    @IBOutlet weak var nativeExpressAdView: GADNativeExpressAdView!
    
    @IBAction func button(_ sender: Any) {
        
        if interstitial.isReady {
            interstitial.present(fromRootViewController: self)
        } else {
            print("Ad wasn't ready")
        }
        
    }
    
    
    @IBAction func button2(_ sender: Any) {
        if GADRewardBasedVideoAd.sharedInstance().isReady == true {
            GADRewardBasedVideoAd.sharedInstance().present(fromRootViewController: self)
        }
    
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Banner
        bannerView = GADBannerView(adSize: kGADAdSizeFullBanner)
        self.view.addSubview(bannerView)
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        bannerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        
        //Interstitial
        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        let request = GADRequest()
        interstitial.load(request)
        
        //NativeExpress
        
        nativeExpressAdView.adUnitID = "ca-app-pub-3940256099942544/6300978111"
        nativeExpressAdView.rootViewController = self
        
        let request2 = GADRequest()
        nativeExpressAdView.load(request2)
        
        
        //Video
        
        GADRewardBasedVideoAd.sharedInstance().delegate = self
        GADRewardBasedVideoAd.sharedInstance().load(GADRequest(),
                                                    withAdUnitID: "ca-app-pub-3940256099942544/1712485313")
        
        
        
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didRewardUserWith reward: GADAdReward) {
        print("Reward received with currency: \(reward.type), amount \(reward.amount).")
    }
    
    func rewardBasedVideoAdDidReceive(_ rewardBasedVideoAd:GADRewardBasedVideoAd) {
        print("Reward based video ad is received.")
    }
    
    func rewardBasedVideoAdDidOpen(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Opened reward based video ad.")
    }
    
    func rewardBasedVideoAdDidStartPlaying(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad started playing.")
    }
    
    func rewardBasedVideoAdDidClose(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad is closed.")
    }
    
    func rewardBasedVideoAdWillLeaveApplication(_ rewardBasedVideoAd: GADRewardBasedVideoAd) {
        print("Reward based video ad will leave application.")
    }
    
    func rewardBasedVideoAd(_ rewardBasedVideoAd: GADRewardBasedVideoAd,
                            didFailToLoadWithError error: Error) {
        print("Reward based video ad failed to load.")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

