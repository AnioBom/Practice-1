//
//  RootViewController.swift
//  Practice#1
//
//  Created by mac on 7/11/23.
//

import UIKit

class RootView: UIView {
    
    private let mainView = MainView()
    
    init() {
        super.init(frame: .zero)
        initialize()
        closurePress()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func closurePress() {
        mainView.buttonAction = { [weak self] color in
            guard let self = self else { return }
            self.backgroundColor = .gray
        }
    }
    
}

private extension RootView {
    func initialize() {
        backgroundColor = .green
        
        addSubview(mainView)
        
        mainView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(350)
        }
    }
}
