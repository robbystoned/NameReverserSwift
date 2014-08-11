//
//  AppDelegate.swift
//  NameReverser
//
//  Created by Robert vd Steen on 15-07-14.
//  Copyright (c) 2014 Robert vd Steen. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
                            
    @IBOutlet var window: NSWindow!
    @IBOutlet var textField: NSTextField!

    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        textField.editable = false;
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }
    
    @IBAction func selectFile(AnyObject){
        var myFiledialog:NSOpenPanel = NSOpenPanel()
        myFiledialog.allowsMultipleSelection = false
        myFiledialog.canChooseDirectories = false
        myFiledialog.runModal()
        var chosenfile = myFiledialog.URL // holds path to selected file, if there is one
        if(chosenfile){
            textField.stringValue = chosenfile.path;
            var filename:String = chosenfile.lastPathComponent;
            var lastPeriod = filename.lastIndexOf(".");
            var name = filename.subString(0, length: lastPeriod);
            var fileExtension = filename.subString(lastPeriod, length: (filename.length - lastPeriod));
            
            println("FileName: " + filename);
            println("name: " + name);
            println("file extension: " + fileExtension);

            
        } else {
            NSLog("no file selected");
        }
    }
    
    func reverseFileName(fileName:String) -> String{
        var strArray:[Character] = [Character]()
        
        for character in fileName {
            strArray.append(character)
        }
        
        //Create a empty string
        var reversedStr:String = ""
        
        
        for var index = strArray.count - 1; index >= 0;--index {
            reversedStr += strArray[index]
        }
        
        return reversedStr;
        
    }
    
}


