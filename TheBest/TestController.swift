//
//  TestController.swift
//  TheBest
//
//  Created by Jessica Joseph on 3/26/16.
//  Copyright © 2016 Jessica Joseph. All rights reserved.
//

import UIKit

class TestController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(TestController.dismissKey))
        view.addGestureRecognizer(tap)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func dismissKey () {
        view.endEditing(true)
    }
}

