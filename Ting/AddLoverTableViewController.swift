//
//  AddLoverTableViewController.swift
//  Ting
//
//  Created by user_05 on 2016/12/20.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class AddLoverTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var image:UIImage? = nil
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        image = info[UIImagePickerControllerOriginalImage] as! UIImage
        //selectPhotoBut.setBackgroundImage(image, for: .normal)
        //selectPhotoBut.setTitle(nil, for: .normal)
        selectPhotoBut.setTitle("已選照片", for: .normal)
        selectPhotoBut.setTitleColor(UIColor.blue, for: .normal)
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var rateSlide: UISlider!
    @IBOutlet weak var segmented: UISegmentedControl!
    //button拉兩條線
    //設定背景
    @IBOutlet weak var selectPhotoBut: UIButton!
    //選擇照片
    @IBAction func selectPhoto(_ sender: Any) {
    
        let controller = UIImagePickerController()
        controller.sourceType = .photoLibrary
        //原本的AddLoverTableViewController是他的代理人，實作imagePickerController
        controller.delegate = self
        present(controller, animated: true, completion: nil)
    }
    @IBOutlet weak var contentTextView: UITextView!
    
    @IBAction func close(_ sender: UITextField) {
        sender.resignFirstResponder()
    }


    @IBOutlet weak var nameTextField: UITextField!

    @IBAction func done(_ sender: Any) {
        
        //print(segmented.selectedSegmentIndex.)
        let mood = segmented.titleForSegment(at: segmented.selectedSegmentIndex)
        //print("\(nameTextField.text!) \(starTextField.text!)")
        //let image = selectPhotoBut.backgroundImage(for: .normal)
        
        //欄位為空的就跳出警告訊息
        if nameTextField.text!.characters.count == 0
            || contentTextView.text!.characters.count == 0
            || image == nil{
            
            //設定跳出信息
            let controller = UIAlertController(title: "錯誤", message: "有欄位尚未填寫", preferredStyle: .alert)
            //設定關閉的按鈕
            let action = UIAlertAction(title:"OK", style: .default, handler: nil)
            controller.addAction(action)
            //顯示UIAlertContro
            
            //ller,completion可以接收一段程式碼，在顯示後執行（也可以是nil，不做事）
            present(controller, animated:  true, completion: nil)
            
            
            return
        }
       
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        let now = Date()
        print( formatter.string(from: now))
        
        //image轉為data型態，才能夠寫檔
        let data = UIImagePNGRepresentation(image!)
        
        let fileManager = FileManager.default
        let docUrls = fileManager.urls(for:.documentDirectory, in:.userDomainMask)
        let docUrl = docUrls.first
        let url = try! docUrl?.appendingPathComponent("\(nameTextField.text!).png")
        //開始寫檔
        //要用try處理例外狀況
        //try?：失敗的話變成nil
        //try!：若不成功程式當掉
        try? data?.write(to: url!)
        
        var rate = rateSlide.value
        let dic = ["name":nameTextField.text!,
                   "date":formatter.string(from: now),
                   "mood":mood,
                   "complete":"\(rate * 100)",
                   "content":contentTextView.text!]
        
        let notiName = Notification.Name("addLover")
        NotificationCenter.default.post(name: notiName, object: nil, userInfo: dic)
        
        _ = self.navigationController?.popViewController(animated: true)
        
    }

    func textViewDidBeginEditing(_ textView: UITextView) {
        print("edit")
        if !contentTextView.text.isEmpty {
            contentTextView.text = nil
            contentTextView.textColor = UIColor.black
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        print("edit")
        if contentTextView.text.isEmpty {
            contentTextView.text = "輸入點什麼吧，隨便說隨便都好記，是不是很簡單啊啊啊"
            contentTextView.textColor = UIColor.gray
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.attributedPlaceholder = NSAttributedString(string:"請輸入標題", attributes: [NSForegroundColorAttributeName: UIColor.gray])
        
        contentTextView.text = "輸入點什麼吧，隨便說隨便都好記，是不是很簡單啊啊啊"
        contentTextView.textColor = UIColor.gray
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
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
     */
    
    /*
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

