//
//  Custom_LoveTableViewController.swift
//  Ting
//
//  Created by user_05 on 2016/12/20.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class Custom_LoveTableViewController: UITableViewController {

    
    var Lovers = [[String:String]]()
    
    var isAddLover = false
 
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if isAddLover
        {
            isAddLover = false
            let indexPath = IndexPath(row: 0,section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
        }
        
    }

    /*通知有新增lover*/
    func addLoverNoti(noti:Notification) {
        
        print("addLoverNoti")
        let dic  = noti.userInfo as! [String:String]
        Lovers.insert( dic,at: 0)
        
        saveFile();
        
        /*當有新增時重新載入資料*/
        /*用動畫取代原本的畫面更新*/
        //self.tableView.reloadData()
        
        isAddLover = true
    }
    
    func editLoverNoti(noti:Notification) {
        
        print("editLoverNoti")
        
        
         loadFile()

        self.tableView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFile()
        
        
        
        //print("Lovers\n\(Lovers[0])")

        
        let notiName = Notification.Name("addLover")
        NotificationCenter.default.addObserver(self, selector: #selector(Custom_LoveTableViewController.addLoverNoti(noti:)), name: notiName, object: nil)
        
        let notiName2 = Notification.Name("editLover")
        NotificationCenter.default.addObserver(self, selector: #selector(Custom_LoveTableViewController.editLoverNoti(noti:)), name: notiName2, object: nil)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //if section == 0 {
            return Lovers.count
            
        //}
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /*
        let cell:UITableViewCell
        let dic:[String:String]
        
       // if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)
            dic = Lovers[indexPath.row]
            
       // }
        
        
        // Configure the cell...
        cell.textLabel?.text = dic["name"]!
        cell.detailTextLabel?.text = dic["star"]!
 
        return cell
        */
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath) as! LoverTableViewCell
        let dic = Lovers[indexPath.row]
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for:.documentDirectory, in:.userDomainMask)
        let docUrl = docUrls.first
        let url = try! docUrl?.appendingPathComponent("\(dic["name"]!).png")
        
        //url?.path
        //url?.absoluteString
        
        // Configure the cell...
        //cell.photoImageView.image = UIImage(named: dic["name"]!)
        cell.photoImageView.image = UIImage(contentsOfFile: (url?.path)!)
        cell.nameLabel.text = dic["name"]
        cell.timeLabel.text = dic["date"]
        //cell.starImageView.image = UIImage(named: dic["star"]!)
        if dic["mood"] == "(〒︿〒)"
        {
            let color = #colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 0.504682149)
            cell.backgroundColor = color
        }
        else if dic["mood"] == "(๑•́ ₃ •̀๑)"
        {
            let color = #colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 0.5)
            cell.backgroundColor = color
            
        }
        else
        {
            let color = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 0.5016588185)
            cell.backgroundColor = color
        }
        return cell

    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */

 
    
    
     // Override to support editing the table view.
    /*左滑欄位可以刪除*/
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        Lovers.remove(at:indexPath.row)
        
        saveFile();
        
        //self.tableView.reloadData()
        /*用動畫取代原本的畫面更新*/
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        //到底是哪個ＣＥＬＬ點選，對應到是哪個情人
        if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow
            let dic:[String:String]
            dic = Lovers[indexPath!.row]
            
            
            let controller = segue.destination as! LoverDetailViewController
            controller.loverInfoDic = dic
            controller.index = indexPath!.row
        }
    }

    /*這邊寫檔*/
    func saveFile()
    {
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for: .documentDirectory,in: .userDomainMask)
        let docUrl = docUrls.first
        let url = docUrl?.appendingPathComponent("lover.txt")
        /*確認是否存擋成功*/
        let result = (Lovers as NSArray).write(to: url!, atomically:true)
        print("saveFile")

    }
    func loadFile()
    {
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for:.documentDirectory, in:.userDomainMask)
        let docUrl = docUrls.first
        let url = try! docUrl?.appendingPathComponent("lover.txt")
        let array = NSArray(contentsOf: url!)
        if array != nil
        {
            Lovers = array as! [[String:String]]
        }
        //print("array\n\(array)")
        print("loadFile")

    }

}
