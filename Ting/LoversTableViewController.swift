//
//  LoversTableViewController.swift
//  Ting
//
//  Created by user_05 on 2016/12/13.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class LoversTableViewController: UITableViewController {

    
    var boyLovers = [[String:String]]()
    var girlLovers = [[String:String]]()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        boyLovers = [["name":"alan", "star":"獅子座","height":"170","weight":"60","interest":"run"], ["name":"小德", "star":"金牛座","height":"180","weight":"60","interest":"sleep"],["name":"大肥宅", "star":"博愛座","height":"190","weight":"60","interest":"eat"]]
        girlLovers = [["name":"angelababy", "star":"牡羊座","height":"162","weight":"50","interest":"heartstone"], ["name":"penny", "star":"金牛座","height":"150","weight":"55","interest":"LOL"]]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return boyLovers.count
            
        }
        else {
            return girlLovers.count
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        let dic:[String:String]
        
        if indexPath.section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: "BoyCell", for: indexPath)
            dic = boyLovers[indexPath.row]
            
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: "GirlCell", for: indexPath)
            dic = girlLovers[indexPath.row]
            
        }
        
        
        // Configure the cell...
        cell.textLabel?.text = dic["name"]!
        cell.detailTextLabel?.text = dic["star"]!
        
        
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
        let indexPath = self.tableView.indexPathForSelectedRow
        let dic:[String:String]
        
        if indexPath!.section == 0
        {
            dic = boyLovers[indexPath!.row]
        }
        else
        {
            dic = girlLovers[indexPath!.row]
        }
        
        let controller = segue.destination as! LoverDetailViewController
        controller.loverInfoDic = dic
    }
 

}
