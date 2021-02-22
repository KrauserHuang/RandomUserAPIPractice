//
//  MainViewController.swift
//  RandomUserAPIPractice
//
//  Created by Tai Chin Huang on 2021/2/22.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var listButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        generateButton.layer.cornerRadius = generateButton.frame.size.height / 5
        listButton.layer.cornerRadius = listButton.frame.size.height / 5
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
