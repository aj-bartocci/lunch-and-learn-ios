//
//  CounterViewController.swift
//  LunchAndLearn
//
//  Created by AJ Bartocci on 1/28/22.
//

import UIKit

class CounterViewController: UIViewController {
    
    let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        return stackView
    }()
    
    let counterLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return label
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 40
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var decrementButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(decrement), for: .touchUpInside)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return button
    }()
    
    let incrementButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(increment), for: .touchUpInside)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        return button
    }()
    
    var count = 0 {
        didSet {
            counterLabel.text = "\(count)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(counterLabel)
        verticalStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(decrementButton)
        buttonStackView.addArrangedSubview(incrementButton)
        
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        counterLabel.text = "\(count)"
    }
    
    @objc
    func increment() {
        count += 1
    }
    
    @objc
    func decrement() {
        count -= 1
    }
    
}

#if DEBUG
import SwiftUI
import SwiftUIPreviewHelpers

struct CounterViewController_Previews: PreviewProvider {

    static var previews: some View {
        Group {
            UIViewControllerPreview {
                let vc = CounterViewController()
                return vc
            }.previewDevice(.iPhone11ProMax)
            
            UIViewControllerPreview {
                let vc = CounterViewController()
                return vc
            }.previewDevice(.iPhoneSE)
        }
    }
}
#endif
