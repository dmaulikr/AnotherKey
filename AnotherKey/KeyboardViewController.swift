//
//  KeyboardViewController.swift
//  AnotherKey
//
//  Created by Jessica Joseph on 3/23/16.
//  Copyright © 2016 Jessica Joseph. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    var keyboardView: UIView!
    var currentIndex: Int!
    var favSelect = true
    @IBOutlet weak var favButton: UIButton!
    
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadKeyboardView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    override func textDidChange(textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
    }
    
    // -----------------------
    // |  Keyboard Dismiss
    // -----------------------
    
    func loadKeyboardView (){
        let keyNib = UINib(nibName: "MainView", bundle: nil)
        keyboardView = keyNib.instantiateWithOwner(self, options: nil)[0] as! UIView
        view.backgroundColor = keyboardView.backgroundColor
        view.addSubview(keyboardView)
        
    }
    
    
    // -----------------------
    // |  Next Button
    // -----------------------
    @IBAction func nextKey() {
        
        advanceToNextInputMode()
        
    }
    
    
    // -----------------------
    // |  Another One Button
    // -----------------------
    
    @IBAction func generateQuote() {
        
        let randomIndex = Int(arc4random_uniform(9))

        
        if !favoriteArray.contains(randomIndex) {
            self.favButton.setBackgroundImage(UIImage(named: "emptyFav.png"), forState: .Normal)

        }
        
        let proxy = textDocumentProxy as UITextDocumentProxy
        proxy.insertText(quotesArray[randomIndex])
        currentIndex = randomIndex

        
    }
    
    
    @IBAction func favorite (){
        if favSelect == true {
            self.favButton.setBackgroundImage(UIImage(named: "filledFav.png"), forState: .Normal)
            
            favSelect = false
            
            if  !favoriteArray.contains(currentIndex){

                favoriteArray.append(currentIndex)
                quotesArray.append(quotesArray[currentIndex!])
                
            }
            
        } else {
            
            self.favButton.setBackgroundImage(UIImage(named: "emptyFav.png"), forState: .Normal)
            favSelect = true
            
            if favoriteArray.contains(currentIndex){
                
                favoriteArray.removeAtIndex(favoriteArray.indexOf(currentIndex)!)
                
            }
        
        }
        
    }
    

    
}

