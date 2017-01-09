//
//  ViewController.swift
//  Ting
//
//  Created by user_03 on 2016/11/29.
//  Copyright © 2016年 user_03. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextViewDelegate{

 
    func textView(_ textView:UITextView,
                  shouldChangeTextIn range:NSRange,
                  replacementText text:String) -> Bool
    {
        if text == "a"
        {
            return false
        }
        else
        {
            return true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        let button = sender as! UIButton
        
        if segue.destination  is SecondViewController {
            let controller = segue.destination as!
            SecondViewController
            if button.currentTitle == "戰士"
            {
                controller.name = "我會碾碎你"
                controller.dictionary = ["name":"戰士","story":"《魔獸世界》總共有11種專業技能可供玩家選擇，分別是：採礦、剝皮、草藥學、裁縫、附魔、鍛造、工程學、珠寶設計、製皮、鍊金術以及銘文學，這些專業技能分為採集型和製造型兩種而玩家可以從中選擇兩種。玩家在遊戲中通過專業獲得的資源和成品可以放到城市中的拍賣場與其他玩家進行交易。很多玩家選擇兩個互相搭配的商業技能，使其可以在採集到需要的資源後馬上進行製造。除此之外，遊戲中還有五種輔助技能：騎術、急救、烹飪、釣魚和考古學。"]
            }
            else
            {
                controller.name = "聖光會逞罰你"
                controller.dictionary = ["name":"牧師","story":"《魔獸世界》擁有數量龐大的地下城（副本），擁有大量擊殺難度超過普通怪物的精英級怪物甚至首領級怪物（在玩家達到最高等級後等級仍顯示為骷髏的怪物），而任務獎勵的和怪物及首領（Boss）掉落的裝備也會比普通任務的獎勵擁有更好的品質。每一個副本中，最多容許一個隊伍進行探險。根據地下城的規模不同一般將副本分為分為地城（最多允許5人進入）、團隊副本（由一個固定上限為10、20、25、40人或一個10-30人的隊伍進入）和事件（一種特殊的副本形式，只允許一個3人小隊加入），而團隊副本的難度和強度都顯著高於地城以及事件。"]
            }
            //controller.label.text = button.currentTitle 畫面上的label還沒生成,設初始值也是不行

        }
        
        
    }
//    override func prepare(for segue: UIStoryboardSegue,
//                          sender: Any?) {
//        
//        let controller = segue.destination as!
//        SecondViewController
//        if segue.identifier == "move1" {
//            controller.name = "hello"
//        }
//        else {
//            controller.name = "hi"
//        }
//        
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField:UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}
