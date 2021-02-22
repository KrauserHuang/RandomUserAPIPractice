//
//  SingleProfileViewController.swift
//  RandomUserAPIPractice
//
//  Created by Tai Chin Huang on 2021/2/21.
//

import UIKit

class SingleProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageButton: UIButton!
    @IBOutlet weak var nameFirstLabel: UILabel!
    @IBOutlet weak var nameLastLabel: UILabel!
    @IBOutlet weak var streetNumberLabel: UILabel!
    @IBOutlet weak var streetNameLabel: UILabel!
    
    var userData: UserData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchUserData()
        fetchImage()
    }
    
    func fetchUserData() {
        let urlStr = "https://randomuser.me/api/"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(UserData.self, from: data)
                        DispatchQueue.main.async {
                            self.userData = result
                            self.nameFirstLabel.text = "First : \(result.results[0].name.first)"
                            self.nameLastLabel.text = "Last : \(result.results[0].name.last)"
                            self.streetNumberLabel.text = "Number : \(result.results[0].location.street.number)"
                            self.streetNameLabel.text = "Name : \(result.results[0].location.street.name)"
//                            self.profileImageButton.imageView?.image = UIImage(data: data)
                        }
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    func fetchImage() {
        if let imageURL = userData.results[0].picture.thumbnail,
           let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    DispatchQueue.main.async {
                        self.profileImageButton.imageView?.image = UIImage(data: data)
                    }
                }
            }
        }
    }
    
    @IBAction func showClearImage(_ sender: UIButton) {
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
