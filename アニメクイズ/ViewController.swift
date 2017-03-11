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
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var questionNumber: UILabel!
    
    @IBOutlet weak var Question: UILabel!
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBAction func choose(_ sender: UIButton)
    {
        
    }
    
    @IBAction func playAgain(_ sender: Any)
    {
        
    }
    
    @IBAction func next(_ sender: Any)
    {
        
    }
        
    struct QandA
    {
        var question:String
        var choice:[String]=[]
        var image:String
        var answer:Int
    }
    
    var number = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
    var question_count = 0
    var score = 0
    var right_answer = 0
    
    //20題問題
    var questions = [QandA(question:"請問殺老師的真實身份為？",choice:["初代死              神","大魔王","魑魅魍魎","廚師"],image:"1.jpg",answer:1),
                     QandA(question:"請問江戶川亂步的異能力是？",choice:["人間失格","請君勿死","超推理","月下獸"],image:"2.jpg",answer:3),
                     QandA(question:"兵長的身高是多少？",choice:["158cm","159cm","160cm","161cm"],image:"3.jpg",answer:3),
                     QandA(question:"久美子擅長的樂器是？",choice:["長笛","雙簧管","上低音號","長號"],image:"4.jpg",answer:3),
                     QandA(question:"日向是哪一所高中的學生？",choice:["青葉城西高中","烏野高中","伊達工業高中","白鳥澤學園高中"],image:"5.jpg",answer:2),
                     QandA(question:"桐山零的專長是？",choice:["圍棋","象棋","西洋棋","將棋"],image:"6.jpg",answer:4),
                     QandA(question:"梅里奧達斯代表七大罪中的哪一罪？",choice:["憤怒","嫉妒","貪婪","暴食"],image:"7.jpg",answer:1),
                     QandA(question:"這名超能力者叫什麼名字？",choice:["齊木國雄","齊木楠雄","齊木靜雄","齊木男雄"],image:"8.jpg",answer:2),
                     QandA(question:"半田君的專長是？",choice:["插花","茶道","劍道","書法"],image:"9.jpg",answer:4),
                     QandA(question:"赤司征十郎是什麼高中？",choice:["洛山高校","誠凜高校","陽泉高校","海常高校"],image:"10.jpg",answer:1),
                     QandA(question:"艾蜜莉雅的身份為？",choice:["嫉妒魔女","妖精","半妖精","劍聖"],image:"11.jpg",answer:3),
                     QandA(question:"怪盜基德的國際罪犯代碼為？",choice:["1410","1411","1412","1413"],image:"12.jpg",answer:3),
                     QandA(question:"Jyugo的範圍編號為？",choice:["1315","1311","1369","1325"],image:"13.jpg",answer:1),
                     QandA(question:"龍之峰帝人的聊天室暱稱為？",choice:["罪歌","巴裘拉","甘樂","田中太郎"],image:"14.jpg",answer:4),
                     QandA(question:"苗木誠現今被稱為？",choice:["超高中級的希望","超高中級的棒球選手","超高中級的名門公子","超高中級的賭徒"],image:"15.jpg",answer:1),
                     QandA(question:"劍心的劍術流派為？",choice:["小太刀二刀流","飛天御劍流","神谷活心流","自我流派"],image:"16.jpg",answer:2),
                     QandA(question:"托雷身上的刺青為？",choice:["X","XI","XII","XIII"],image:"17.jpg",answer:4),
                     QandA(question:"藤沼悟的能力為？",choice:["再上映","死亡回歸","念動力","交換身份"],image:"18.jpg",answer:1),
                     QandA(question:"埼玉老師在英雄認證考試中的評定為？",choice:["A級","B級","C級","D級"],image:"19.jpg",answer:3),
                     QandA(question:"與凜訂定契約的英靈為？",choice:["Saber","Lancer","Rider","Archer"],image:"20.jpg",answer:4)]
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        showQuestion()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func showQuestion()
    {
        question_count = question_count + 1
        
        //generate a random number in [0,19]
        let random_number = Int(arc4random_uniform(20))
        
        image.image = UIImage(named: questions[random_number].image)
        questionNumber.text = "第\(question_count)題"
        Question.text = questions[random_number].question
        for i in 0..<buttons.count
        {
            buttons[i].setTitle(questions[random_number].choice[i], for: .normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

