//
//  SecondViewController.swift
//  Ting
//
//  Created by user_05 on 2016/12/6.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit
//用不到
class SecondViewController: UIViewController {

    //@IBOutlet weak var label: UILabel!
    //@IBOutlet weak var textView: UITextView!

    var name:String!
    var dictionary:[String:String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.label.text = name
        //self.navigationItem.title = dictionary["name"]
        //self.textView.text = dictionary["story"]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
