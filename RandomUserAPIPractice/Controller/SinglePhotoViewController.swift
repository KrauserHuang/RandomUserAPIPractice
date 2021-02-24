//
//  SinglePhotoViewController.swift
//  RandomUserAPIPractice
//
//  Created by Tai Chin Huang on 2021/2/21.
//

import UIKit

class SinglePhotoViewController: UIViewController {
    
    var userData: UserData!
    
    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        showImage()
    }

    func showImage() {
        URLSession.shared.dataTask(with: userData.results[0].picture.large!) { (data, response, error) in
            if let data = data {
                DispatchQueue.main.async {
                    self.photoImageView.image = UIImage(data: data)
                }
            }
        }.resume()
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
