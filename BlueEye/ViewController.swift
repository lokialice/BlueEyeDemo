//
//  ViewController.swift
//  BlueEye
//
//  Created by Macbook Pro MD102 on 5/15/15.
//  Copyright (c) 2015 Macbook Pro MD102. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {

    var currentValue:Int = 50
    var targetValue:Int = 0
    var round:Int = 0
    var score:Int = 0
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var scoredLabel: UILabel!
    @IBOutlet var targetLabel: UILabel!
    @IBAction func showAlert(sender: AnyObject) {
        
//        if currentValue > targetValue {
//            difference =  currentValue - targetValue
//        }
//        else if targetValue > currentValue {
//            difference =  targetValue - currentValue
//        }else {
//            difference = 0
//        }
       
        let diference = abs(targetValue - currentValue)
        println(diference)
        var points = 100 - diference
        var title:String
        if diference == 0 {
            title = "Perfect!"
            points += 100
        }else if diference < 5 {
            title = "You almost had it"
            points += 50
        }else if diference < 10 {
            title = "Pretty Good!"
        }else {
            title = "Not even close"
        }
        score += points
         let message = "The value of slider is: \(currentValue)" + " \nThe target value is: \(targetValue)" + "\nThe difference is:\(diference)" + " \nYou scored \(points) points"
         let alert = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        let action  = UIAlertAction(title: "Ok", style: .Default, handler: nil)
        alert.addAction(action)
        presentViewController(alert, animated: true, completion: nil)
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
//        let alert = UIAlertController(title: "Hello, world", message: "This is my first app", preferredStyle: .Alert)
//        let action = UIAlertAction(title: "Awsome", style: .Default, handler: nil)
//        alert.addAction(action)
//        presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(sender: UISlider) {
        currentValue = lroundf(sender.value)
    }
    func updateLabel(){
        targetLabel.text = String(targetValue)
        scoredLabel.text  = String(score)
        roundLabel.text = String(round)
    }
//    func starNewArround(){
//        targetValue = 1 + Int(arc4random_uniform(100))
//        currentValue = 50
//        slider.value = Float(currentValue)
//    }
    
    @IBAction func btnStartOver(sender: AnyObject) {
        score = 0
        round = 0
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        let trasition = CATransition()
        trasition.type =  kCATransitionFade
        trasition.duration = 1
        trasition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        round += 1
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabel()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, forState: .Normal)
        
        let thumbImageHighlight = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlight, forState: .Highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        if let trackleftImage = UIImage(named: "SliderTrackLeft"){
            let trackleftResizable = trackleftImage.resizableImageWithCapInsets(insets)
            slider.setMinimumTrackImage(trackleftResizable, forState: .Normal)
        }
        if let trackRightImage = UIImage(named: "SliderTrackRight") {
            let trackrightResizable = trackRightImage.resizableImageWithCapInsets(insets)
            slider.setMaximumTrackImage(trackrightResizable, forState: .Normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

