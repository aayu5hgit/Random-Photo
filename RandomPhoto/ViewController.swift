//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Aayush Talreja on 03/12/22.
//

import UIKit

class ViewController: UIViewController {

    //Setting up imageView using UIImageView (User Interface Image View)
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    //Setting up button using UIButton (User Interface Button)
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        button.setTitle("Shuffle", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0.9394168258, green: 0.8027816415, blue: 0.8563931584, alpha: 1).cgColor, UIColor(red: 105/255, green: 205/255, blue: 218/255, alpha: 1).cgColor]
        gradientLayer.shouldRasterize = true
        view.layer.addSublayer(gradientLayer)
//        view.backgroundColor = .systemBrown;
        view.addSubview(imageView) //Showing imageView
        imageView.frame = CGRect(x: 0,
                                 y: 0,
                                 width: 300,
                                 height: 300) // Setting frame for imageView
        imageView.center = view.center //Align imageView to center
        
        //Showing button and setting position using CGRect
        view.addSubview(button)
        button.frame = CGRect(x: 20,
                              y: view.frame.size.height-100,
                              width: view.frame.size.width-40,
                              height: 50)
        getRandomPhoto()
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
    }
    
    @objc func tapButton(){
        getRandomPhoto()
        //Adding ScaleX Transformation Animation on button click
        UIView.animate(withDuration: 0.2,
            animations: {
                self.button.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            },
            completion: { _ in
                UIView.animate(withDuration: 0.2) {
                    self.button.transform = CGAffineTransform.identity
                }
            })
    }
    
    func getRandomPhoto(){
        let urlString = "https://source.unsplash.com/random/600x600" //Put the URL of images in a string
        let url = URL(string: urlString)! //Fetch the URL of the string
        //Get the data out of the fetched URL:

        guard let data = try? Data(contentsOf: url) else{
            return
        }
        //Put the data in the imageview and call the function
        imageView.image = UIImage(data: data)
    }
}
