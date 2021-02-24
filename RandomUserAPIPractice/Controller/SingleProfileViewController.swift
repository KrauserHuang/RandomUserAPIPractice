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
    @IBOutlet weak var imageView: UIImageView!
    
    var userData: UserData!
    var userImage: UserData.Result.Picture!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = imageView.frame.size.height / 2
        fetchUserData()
//        fetchImage()
    }
    
    func fetchUserData() {
        let urlStr = "https://randomuser.me/api/"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data,
                   let content = String(data: data, encoding: .utf8) {
                    print(content)
                    let decoder = JSONDecoder()
                    do {
                        let result = try decoder.decode(UserData.self, from: data)
                        self.userData = result
                        self.userImage = result.results[0].picture
                        DispatchQueue.main.async {
                            self.nameFirstLabel.text = "First : \(result.results[0].name.first)"
                            self.nameLastLabel.text = "Last : \(result.results[0].name.last)"
                            self.streetNumberLabel.text = "Number : \(result.results[0].location.street.number)"
                            self.streetNameLabel.text = "Name : \(result.results[0].location.street.name)"
//                            self.imageView.image = UIImage(data: data)
//                            print("\(result.results[0].picture.thumbnail)")
                        }
                        URLSession.shared.dataTask(with: self.userImage.large!) { (data, response, error) in
                            if let data = data {
                                DispatchQueue.main.async {
                                    self.imageView.image = UIImage(data: data)
//                                    self.profileImageButton.imageView?.image = UIImage(data: data)
//                                    self.profileImageButton.setImage(UIImage(data: data), for: .normal)
                                }
                            }
                        }.resume()
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
//    func fetchImage() {
//        URLSession.shared.dataTask(with: userData.results[0].picture.large!) { (data, response, error) in
//            if let data = data {
//                let decoder = JSONDecoder()
//                DispatchQueue.main.async {
//                    self.imageView.image = UIImage(data: data)
//                }
//            }
//        }.resume()
//    }
    
    @IBSegueAction func showImage(_ coder: NSCoder) -> SinglePhotoViewController? {
        let controller = SinglePhotoViewController(coder: coder)
        controller?.userData = userData
        return controller
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
