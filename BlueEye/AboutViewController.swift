//
//  AboutViewController.swift
//  BlueEye
//
//  Created by Macbook Pro MD102 on 5/16/15.
//  Copyright (c) 2015 Macbook Pro MD102. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet var webView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let htmlFile = NSBundle.mainBundle().pathForResource("BullsEye", ofType: "html")
        let htmlData = NSData(contentsOfFile: htmlFile!)
        let baseUrl = NSURL.fileURLWithPath(NSBundle.mainBundle().bundlePath)
        webView.loadData(htmlData, MIMEType: "text/html", textEncodingName: "UTF-8", baseURL: baseUrl)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClose(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
