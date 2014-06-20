//
//  ViewController.swift
//  test app
//
//  Created by Michael Pulsifer on 6/20/14.
//  Copyright (c) 2014 U.S. Department of Labor. Public Domain.
//

import UIKit

class ViewController: UIViewController, GovDataRequestProtocol {

   
    var firstRequest: GovDataRequest = GovDataRequest(APIKey: "", APIHost: "http://data.fcc.gov", APIURL: "/lpfmapi/rest/v1/lat/36")
    //var firstRequest: GovDataRequest = GovDataRequest(APIKey: "", APIHost: "https://itunes.apple.com", APIURL: "/search")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.firstRequest.delegate = self
        //var arguments = Dictionary<String, String>()
        var arguments = ["format": "json", "secondchannel": "true"]
        var timeOut = 60.0
        firstRequest.callAPIMethod(method: "long/-119", arguments: arguments, timeOut: timeOut)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didCompleteWithError (errorMessage: String) {
        NSLog("error")
        
    }
    
    func didCompleteWithArray (results:NSArray) {
        println("success!")
        //Let's see what we've got
        for item : AnyObject in results {
            if let oneItem = item as? NSDictionary {
                println("Dictionary!")
            } else {
                println("Not a Dictionary!")
            }
            
        }

    }
}

