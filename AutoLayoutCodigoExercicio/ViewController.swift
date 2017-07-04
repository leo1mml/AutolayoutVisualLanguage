//
//  ViewController.swift
//  AutoLayoutCodigoExercicio
//
//  Created by Leonel Menezes on 03/07/17.
//  Copyright © 2017 BEPID. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let buttonAlterar = UIButton()
    let yellowView = UIView()
    let redView = UIView()
    let blueView = UIView()
    let grayView = UIView()
    var myViews = [String : Any]()
    var isDifferent = false
    
    var constraintToChange = [NSLayoutConstraint]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .black
        initViews()
        prepareAllViews()
        autoLayoutSuperView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func initViews(){
        self.myViews["button"] = self.buttonAlterar
        self.myViews["yellowView"] = self.yellowView
        self.myViews["redView"] = self.redView
        self.myViews["blueView"] = self.blueView
        self.myViews["grayView"] = self.grayView
        self.buttonAlterar.translatesAutoresizingMaskIntoConstraints = false
        self.buttonAlterar.restorationIdentifier = "botao"
        self.buttonAlterar.accessibilityIdentifier = "botao"
        self.view.addSubview(self.buttonAlterar)
        self.yellowView.translatesAutoresizingMaskIntoConstraints = false
        self.yellowView.accessibilityIdentifier = "yellowView"
        self.yellowView.restorationIdentifier = "yellowView"
        self.view.addSubview(self.yellowView)
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        self.blueView.restorationIdentifier = "blueView"
        self.blueView.accessibilityIdentifier = "blueView"
        self.view.addSubview(self.blueView)
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.redView.accessibilityIdentifier = "redView"
        self.redView.accessibilityIdentifier = "redView"
        self.view.addSubview(self.redView)
        self.grayView.translatesAutoresizingMaskIntoConstraints = false
        self.grayView.accessibilityIdentifier = "grayView"
        self.grayView.restorationIdentifier = "grayView"
        self.view.addSubview(self.grayView)
    }
    
    func prepareAllViews(){
        prepareButton()
        prepareYellowView()
        prepareBlueView()
        prepareRedView()
        prepareGrayView()
    }

    
    func prepareButton(){
        
        self.buttonAlterar.backgroundColor = UIColor.white
        self.buttonAlterar.tintColor = UIColor.blue
        self.buttonAlterar.setTitle("Alterar", for: .normal)
        self.buttonAlterar.setTitleColor(.blue, for: .normal)
        self.buttonAlterar.addTarget(self, action: #selector(alterarTamanho), for: .touchUpInside)
        
    }
    func prepareYellowView(){
        self.yellowView.backgroundColor = UIColor.yellow
    }
    func prepareBlueView(){
        self.blueView.backgroundColor = UIColor.blue
    }
    func prepareRedView(){
        self.redView.backgroundColor = UIColor.red
    }
    func prepareGrayView() {
        self.grayView.backgroundColor = UIColor.gray
    }
    
    func autoLayoutSuperView(){
        let horizontalButtonYellowConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[button(100)]-[yellowView]-|", options: [], metrics: nil, views: myViews)
        let horizontalBlueViewConstraint = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[blueView]-|", options: [], metrics: nil, views: myViews)
        let horizontalRedGrayView = NSLayoutConstraint.constraints(withVisualFormat: "H:|-[redView]-[grayView(==redView)]-|", options: [], metrics: nil, views: myViews)
        
        let verticalButtonBlueRedView = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[button(50)]-[blueView]-[redView(200@500)]-10-|", options: [], metrics: nil, views: myViews)
        
        let verticalYellow = NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[yellowView(==button)]", options: [], metrics: nil, views: myViews)
        let verticalGray = NSLayoutConstraint.constraints(withVisualFormat: "V:[grayView(==redView)]-10-|", options: [], metrics: nil, views: myViews)
//
       
        
        NSLayoutConstraint.activate(
            horizontalButtonYellowConstraint +
            verticalYellow +
            verticalButtonBlueRedView +
            horizontalBlueViewConstraint +
            horizontalRedGrayView +
//            horizontalButtonYellowConstraint +
//            verticalButtonBlueRedView +
            verticalGray
//            horizontalRedGrayView +
//            verticalYellow
        )
        
        self.constraintToChange = NSLayoutConstraint.constraints(withVisualFormat: "V:[redView(100@750)]-10-|", options: [], metrics: nil, views: myViews)
    }
    
    func alterarTamanho(_ sender: UIButton!){
        if isDifferent {
            
            NSLayoutConstraint.deactivate(self.constraintToChange)
            
        }else{
            
            NSLayoutConstraint.activate(self.constraintToChange)
            
        }
        isDifferent = !isDifferent
    }

}

