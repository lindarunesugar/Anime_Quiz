//
//  ViewController.swift
//  アニメクイズ
//
//  Created by Huang Pi-Ling on 2017/3/11.
//  Copyright © 2017年 Huang Pi-Ling. All rights reserved.
//

import UIKit



class ViewController: UIViewController
{
    struct QandA
    {
        var question:String
        var choice:[String]=[]
        var image:String
        var answer:String
    }
    
    var number = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var question_count = 0
    var score = 0
    var right_answer = ""
    
    //20題問題
    var questions = [QandA(question:"請問殺老師的真實身份為？",choice:["初代死神","大魔王","魑魅魍魎","廚師"],image:"1.jpg",answer:"初代死神"),
                     QandA(question:"請問江戶川亂步的異能力是？",choice:["人間失格","請君勿死","超推理","月下獸"],image:"2.jpg",answer:"超推理"),
                     QandA(question:"兵長的身高是多少？",choice:["158cm","159cm","160cm","161cm"],image:"3.jpg",answer:"160cm"),
                     QandA(question:"久美子擅長的樂器是？",choice:["長笛","雙簧管","上低音號","長號"],image:"4.jpg",answer:"上低音號"),
                     QandA(question:"日向是哪一所高中的學生？",choice:["青葉城西高中","烏野高中","伊達工業高中","白鳥澤學園高中"],image:"5.jpg",answer:"烏野高中"),
                     QandA(question:"桐山零的專長是？",choice:["圍棋","象棋","西洋棋","將棋"],image:"6.jpg",answer:"將棋"),
                     QandA(question:"梅里奧達斯代表七大罪中的哪一罪？",choice:["憤怒","嫉妒","貪婪","暴食"],image:"7.jpg",answer:"憤怒"),
                     QandA(question:"這名超能力者叫什麼名字？",choice:["齊木國雄","齊木楠雄","齊木靜雄","齊木男雄"],image:"8.jpg",answer:"齊木楠雄"),
                     QandA(question:"半田君的專長是？",choice:["插花","茶道","劍道","書法"],image:"9.jpg",answer:"書法"),
                     QandA(question:"赤司征十郎是什麼高中？",choice:["洛山高校","誠凜高校","陽泉高校","海常高校"],image:"10.jpg",answer:"洛山高校"),
                     QandA(question:"艾蜜莉雅的身份為？",choice:["嫉妒魔女","妖精","半妖精","劍聖"],image:"11.jpg",answer:"半妖精"),
                     QandA(question:"怪盜基德的國際罪犯代碼為？",choice:["1410","1411","1412","1413"],image:"12.jpg",answer:"1412"),
                     QandA(question:"Jyugo的犯人編號為？",choice:["1315","1311","1369","1325"],image:"13.jpg",answer:"1315"),
                     QandA(question:"龍之峰帝人的聊天室暱稱為？",choice:["罪歌","巴裘拉","甘樂","田中太郎"],image:"14.jpg",answer:"田中太郎"),
                     QandA(question:"苗木誠現今被稱為？",choice:["超高中級的希望","超高中級的棒球選手","超高中級的名門公子","超高中級的賭徒"],image:"15.jpg",answer:"超高中級的希望"),
                     QandA(question:"劍心的劍術流派為？",choice:["小太刀二刀流","飛天御劍流","神谷活心流","自我流派"],image:"16.jpg",answer:"飛天御劍流"),
                     QandA(question:"托雷身上的刺青為？",choice:["X","XI","XII","XIII"],image:"17.jpg",answer:"XIII"),
                     QandA(question:"藤沼悟的能力為？",choice:["再上映","死亡回歸","念動力","交換身份"],image:"18.jpg",answer:"再上映"),
                     QandA(question:"埼玉老師在英雄認證考試中的評定為？",choice:["A級","B級","C級","D級"],image:"19.jpg",answer:"C級"),
                     QandA(question:"與凜訂定契約的英靈為？",choice:["Saber","Lancer","Rider","Archer"],image:"20.jpg",answer:"Archer")]

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var Question: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var Play_Again_Outlet: UIButton!
    
    @IBAction func choose(_ sender: UIButton)
    {
        if sender.currentTitle == right_answer
        {
            score = score + 10
        }
        
        if question_count == 10
        {
            show_alertController()
            Play_Again_Outlet.isHidden = false
        }
        else
        {
            showQuestion()
        }
    }
    
    @IBAction func playAgain(_ sender: Any)
    {
        initialize()
        showQuestion()
        Play_Again_Outlet.isHidden = true
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showQuestion()
    {
        question_count = question_count + 1
        //choose question in random
        //generate a random number in number array
        let random_number = Int(arc4random_uniform(UInt32(number.count)))
        //corresponding content with index of the random_number
        let value = number[random_number]
        
        image.image = UIImage(named: questions[value].image)
        questionNumber.text = "第\(question_count)題"
        Question.text = questions[value].question
        
        //sort choice in random
        var choice_index = [0,1,2,3]
        for i in 0..<buttons.count
        {
            let random_number_for_choice_index = Int(arc4random_uniform(UInt32(choice_index.count)))
            let choice_value = choice_index[random_number_for_choice_index]
            buttons[i].setTitle(questions[value].choice[choice_value], for: .normal)
            choice_index.remove(at: random_number_for_choice_index)
            
        }

        number.remove(at: random_number)
        right_answer = questions[value].answer
    }
    
    func show_alertController()
    {
        // 建立一個提示框
        let alertController = UIAlertController(
            title: "測驗結束",
            message: "得分為\(score)分(滿分100)",
            preferredStyle: .alert)
        // 建立[確認]按鈕
        let okAction = UIAlertAction(
            title: "確認",
            style: .default,
            handler:{
                (action: UIAlertAction!) -> Void in
                
        })
        alertController.addAction(okAction)
        // 顯示提示框
        self.present(alertController, animated: true, completion: nil)
    }
    
    func initialize()
    {
        number = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
        question_count = 0
        score = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

