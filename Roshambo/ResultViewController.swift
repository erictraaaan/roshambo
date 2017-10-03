//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Eric Tran on 2017-09-30.
//  Copyright © 2017 Eric Tran. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    //ROCK = 0
    //PAPER = 1
    //SCISSORS = 2
    
    // 0 beats 2
    // 1 beats 0
    // 2 beats 1
    
    @IBOutlet weak var name: UITextView!
    @IBOutlet weak var myImage: UIImageView!
    
    var userChoice: Int = 0
    
    var firstValue: String = "Rock"
    
    var computerChoice: Int = 0
    var computerChoiceString: String = "Rock"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = self.firstValue
        
        computerChoice = generateRandomNum()
        
        switch computerChoice {
        case 0:
            computerChoiceString = "Rock"
        case 1:
            computerChoiceString = "Paper"
        case 2:
            computerChoiceString = "Scissors"
        default:
            computerChoiceString = "Error"
        }
        
        switch userChoice {
        case 0:
            if computerChoice == 2 {
                name.text = "Rock beats Scissors. You win!"
                myImage.image = UIImage(named: #imageLiteral(resourceName: "RockCrushesScissors"))
            } else {
                youLose()
            }
            
        case 1:
            if computerChoice == 0 {
                name.text = "Paper beats Rock. You win!"
                myImage.image = UIImage(named: #imageLiteral(resourceName: "PaperCoversRock"))
            } else {
                youLose()
            }
        case 2:
            if computerChoice == 1{
                name.text = "Scissors beats Paper. You win!"
                myImage.image = UIImage(named: #imageLiteral(resourceName: "ScissorsCutPaper"))
            } else {
                youLose()
            }
        default:
            name.text = "Sorry, you lose"
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func youLose(){
        if (userChoice != computerChoice){
//            print ("NO TIE")
//            print ("User Choice: \(userChoice) ")
//            print ("Computer Choice: \(computerChoice)")
            name.text = "You picked \(firstValue), and we picked \(computerChoiceString), you lose!"
        } else {
//            print ("TIE")
//            print ("User Choice: \(userChoice) ")
//            print ("Computer Choice: \(computerChoice)")
            
            name.text = "You picked \(firstValue), and we picked \(computerChoiceString), it's a tie!"
        }

    }
    
    func generateRandomNum() -> Int {
        let randomChoice = Int(arc4random_uniform(3))
        return randomChoice
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
