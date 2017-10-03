//
//  ViewController.swift
//  Roshambo
//
//  Created by Eric Tran on 2017-09-30.
//  Copyright © 2017 Eric Tran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //three ways of transitioning to another view controller:
    // 1) programmatically
    // 2) segue and code
    // 3) segue only (scissors button)

    @IBAction func rockClicked(_ sender: Any) { // programmatically
        let controller: ResultViewController
        controller = self.storyboard?.instantiateViewController(withIdentifier: "resultViewController") as! ResultViewController
        controller.firstValue = "Rock"
        controller.userChoice = 0
        
        present(controller, animated: true, completion: nil)
        
    }
    @IBAction func paperClicked(_ sender: Any) { // segue and code
        
        //use prepareforSegue
        performSegue(withIdentifier: "mySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "mySegue"{
            let controller = segue.destination as! ResultViewController
            
            controller.firstValue = "Paper"
            controller.userChoice = 1
        }
        
        if segue.identifier == "scissorsSegue"{
            let controller = segue.destination as! ResultViewController
            controller.firstValue = "Scissors"
            controller.userChoice = 2
        }

        
        
    }
}

