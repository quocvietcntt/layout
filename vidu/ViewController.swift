//
//  ViewController.swift
//  vidu
//
//  Created by apple on 2024/08/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nutBMI: UIButton!
    let titleLabel: UILabel = {
        let tieude = UILabel()
        tieude.translatesAutoresizingMaskIntoConstraints = false
        tieude.text = "Best app for your trip"
        tieude.font = UIFont.boldSystemFont(ofSize: 48)
        tieude.numberOfLines  = 2
        tieude.textAlignment = .center
        tieude.textColor = UIColor.white
        return tieude
    }()
    
    let signUpbutton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.orange
        button.setTitle("Sign Up", for: UIControl.State.normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    let signInbutton: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.setTitle("Sign In", for: UIControl.State.normal)
        button.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        button.layer.cornerRadius = 20
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "kk")!)
        nutBMI.setTitleColor(UIColor.blue, for: UIControl.State.normal)
        nutBMI.layer.cornerRadius = 20
        addsubview()
        setupview()
    }
    
    func addsubview() {
        view.addSubview(titleLabel)
        view.addSubview(signInbutton)
        view.addSubview(signUpbutton)
    }

    func setupview()  {
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        signUpbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        signUpbutton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        signUpbutton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        
        signInbutton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signInbutton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80).isActive = true
        signInbutton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        signInbutton.widthAnchor.constraint(equalTo: signUpbutton.widthAnchor, multiplier: 1).isActive = true
        
    }

    @IBOutlet var BMI: UIView!
    @IBAction func BmiApp(_ sender: Any) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let Bmi = st.instantiateViewController(withIdentifier: "bmicell") as! bmiViewController
        self.navigationController?.pushViewController(Bmi, animated: true)
    }
   
    
}

