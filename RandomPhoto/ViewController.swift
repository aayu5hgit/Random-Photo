//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Ashish Ahuja on 03/12/22.
//

import UIKit

class ViewController: UIViewController {

    //Setting up imageView using UIImageView (User Interface Image View)
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Setting up button using UIButton (User Interface Button)
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .brown
        button.setTitle("Random Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown;
        view.addSubview(imageView) //Showing imageView
        imageView.frame = CGRect(x: 0, y: 0, width: 300, height: 300) // Setting frame for imageView
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

