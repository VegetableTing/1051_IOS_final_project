//
//  LoverDetailViewController.swift
//  Ting
//
//  Created by user_05 on 2016/12/13.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class LoverDetailViewController: UIViewController , UINavigationControllerDelegate{

    var Lovers = [[String:String]]()

    var loverInfoDic:[String:String]! 
    var index:Int = 0
    @IBOutlet weak var imageShow: UIImageView!
    

    @IBOutlet weak var rateDetail: UILabel!
    @IBOutlet weak var heightDetail: UILabel!
    @IBOutlet weak var weightDetail: UILabel!
    @IBOutlet weak var contentDetail: UITextView!
    
    @IBAction func edit(_ sender: Any) {
        print(contentDetail.text!)
        print("edit")
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for:.documentDirectory, in:.userDomainMask)
        let docUrl = docUrls.first
        let url = try! docUrl?.appendingPathComponent("lover.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil
        {
            Lovers = array as! [[String:String]]
        }
        Lovers[index]["content"] = contentDetail.text!
        
        let result = (Lovers as NSArray).write(to: url!, atomically:true)
        print("save")
   

        print(Lovers)
        
        let notiName = Notification.Name("editLover")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: loverInfoDic)
        
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        

        super.viewDidLoad()

        weightDetail.text = loverInfoDic["mood"]!
        heightDetail.text = loverInfoDic["date"]!
        heightDetail.textAlignment = NSTextAlignment.center
        rateDetail.text = "\(loverInfoDic["complete"]!)%"
        contentDetail.text = loverInfoDic["content"]!
        contentDetail.layer.cornerRadius = 5
        contentDetail.layer.borderWidth = 1
        
        
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for:.documentDirectory, in:.userDomainMask)
        let docUrl = docUrls.first
        let url = try! docUrl?.appendingPathComponent("\(loverInfoDic["name"]!).png")
        imageShow.image = UIImage(contentsOfFile: (url?.path)!)
        imageShow.layer.cornerRadius = 5
        imageShow.layer.borderWidth = 1
        
        print(index)
        self.navigationItem.title = loverInfoDic["name"]!
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
