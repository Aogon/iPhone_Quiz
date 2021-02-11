//
//  QuizViewController.swift
//  Quiz
//
//  Created by Sakai Aoi on 2021/02/11.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    
    @IBOutlet var quizImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        quizArray.append(["このいちごの品種は？", "アイベリー", "あまおう", "章姫", 2, "amaou.jpg"])
        quizArray.append(["このいちごの品種は？", "あすかルビー", "あまおとめ", "あまみつ", 1, "asukaruby.jpg"])
        quizArray.append(["このいちごの品種は？", "阿波ほうべに", "淡雪", "いばらキッス", 2, "awayuki.jpg"])
        quizArray.append(["このいちごの品種は？", "古都華", "恋みのり", "恋の香", 1, "kotoka.jpg"])
        quizArray.append(["このいちごの品種は？", "サマープリンセス", "なつおとめ", "真紅の美鈴", 3, "shinkunomisuzu.jpg"])
        quizArray.append(["このいちごの品種は？", "ゆめのか", "華かがり", "ひのしずく", 1, "yumenoka.jpg"])
        
        quizArray.shuffle()
        
        choiceQuiz()
        // Do any additional setup after loading the view.
        
    }
    
    func choiceQuiz() {
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
        quizImageView.image = UIImage(named: tmpArray[5] as! String)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        if tmpArray[4] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
