//
//  ViewController.swift
//  score－add
//
//  Created by 5759 on 16/4/18.
//  Copyright © 2016年 20131105759. All rights reserved.
//

//http://www.hangge.com/blog/cache/detail_645.html


//http://www.runoob.com/sqlite/sqlite-tutorial.html

//http://www.w2bc.com/article/91624






import UIKit



class ViewController: UIViewController {
    
    //建立数据库
    var db:SQLiteDB!
    
    @IBOutlet var text2: UITextField!
    @IBOutlet var text1: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,team varchar(20),score varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    
    var a = 0
    var b = 0
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!

    //保存
    @IBAction func button5(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        //if data.count > 0 {
        for var x=0 ; x< date.count ; x++{
            //获取最后一行数据显示
            let user = data[data.count-1]
            record.text! +=(user["team"] as? String)! +
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
    }
    
    //保存数据到SQLite
    func saveUser() {
        let team = self.text1.text!
        let score = self.label1.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(team,score) values('\(team)','\(score)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    
    
    
    
    
    
    //加分
    @IBAction func button4(sender: UIButton) {
        if(!label2.text!.isEmpty)
        {
            b = (label2.text!as NSString).integerValue
            b = b+1
            label2.text = ("\(b)")
        }
    }
    @IBAction func button3(sender: UIButton) {
        if(!label1.text!.isEmpty)
        {
            a = (label1.text!as NSString).integerValue
            a = a+1
            label1.text = ("\(a)")
        }
    }
    //清零
    @IBAction func button2(sender: UIButton) {
        
        //名称
        if(!text1.text!.isEmpty)
        {
            text1.text = ("")
        }
        if(!text2.text!.isEmpty)
        {
            text2.text = ("")
        }

        
        //分数
        if(!label1.text!.isEmpty)
        {
            a = (label1.text!as NSString).integerValue
            a = 0
            label1.text = ("\(a)")
        }

        
        if(!label2.text!.isEmpty)
        {
            b = (label2.text!as NSString).integerValue
            b = 0
            label2.text = ("\(b)")
        }
    }
}
