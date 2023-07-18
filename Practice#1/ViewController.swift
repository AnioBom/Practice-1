//
//  ViewController.swift
//  Practice#1
//
//  Created by mac on 7/11/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let rootView = RootView()
    
    var lightOn = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupConstraints()
        
       // mainView.delegate = self
    }

    
}

extension ViewController {
    private func setupConstraints() {
        
        view.addSubview(rootView)
        
        rootView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(320)
            make.height.equalTo(500)
        }
        
    }
}

extension ViewController: SelectButtonDelegate {
    func didSelectButton(color: UIColor?) {
        
        if lightOn {
            view.backgroundColor = color
        } else {
            view.backgroundColor = .red
        }
        lightOn = !lightOn
    }
    
    
}

