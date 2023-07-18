//
//  MainViewController.swift
//  Practice#1
//
//  Created by mac on 7/11/23.
//

import UIKit
import SnapKit

protocol SelectButtonDelegate: AnyObject {
    func didSelectButton(color: UIColor?)
}

class MainView: UIView {
   
    weak var delegate: SelectButtonDelegate?
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties
    
    lazy var blueDelagate: UIButton = {
        let button = UIButton()
        button.setTitle("Blue Delegate", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.yellow, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(firstButtonTipped), for: .touchUpInside)
        return button
    }()
    
    lazy var cyanResponderChain: UIButton = {
        let button = UIButton()
        button.setTitle("Cyan Responder Chain", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.yellow, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 15
        return button
    }()
    
    lazy var greyClosure: UIButton = {
        let button = UIButton()
        button.setTitle("Grey Closure", for: .normal)
        button.backgroundColor = .gray
        button.setTitleColor(.yellow, for: .normal)
        button.clipsToBounds = false
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(closureButtonPress), for: .touchUpInside)
        return button
    }()
    
    @objc func firstButtonTipped() {
        delegate?.didSelectButton(color: .cyan)
    }
    
    @objc func closureButtonPress() {
        buttonAction?(.gray)
    }
    
    var buttonAction: ((_ color: UIColor) -> Void)?
    
}

// MARK: - Extention 

private extension MainView {
    func initialize() {
        backgroundColor = .yellow
        
        addSubview(blueDelagate)
        addSubview(cyanResponderChain)
        addSubview(greyClosure)
        
        blueDelagate.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(45)
        }
        
        cyanResponderChain.snp.makeConstraints { make in
            make.top.equalTo(blueDelagate.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(45)
        }
        
        greyClosure.snp.makeConstraints { make in
            make.top.equalTo(cyanResponderChain.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(45)
        }
    }
}
