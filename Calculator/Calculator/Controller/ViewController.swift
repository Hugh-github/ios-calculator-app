//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var operatorLabel: UILabel!
    @IBOutlet weak var operandLabel: UILabel!
    
    @IBOutlet weak var superStackView: UIStackView!
    
    var totalExpression: String = ""
    var extraNumber: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        operatorLabel.text = ""
        operandLabel.text = "0"
        
        superStackView.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        
        if  extraNumber.isEmpty && checkRepeatZero(input: number) {
            operandLabel.text = "0"
        } else if extraNumber.isEmpty && number == "." {
            extraNumber += "0."
            totalExpression += "0."
            operandLabel.text = extraNumber
        } else {
            extraNumber += number
            totalExpression += number
            operandLabel.text = extraNumber
        }
        print(totalExpression)
    }
    
    @IBAction func tapOperatorButton(_ sender: UIButton) {
        guard let sign = sender.currentTitle else { return }

        if !totalExpression.isEmpty && operandLabel.text == "0" {
            operatorLabel.text = sign
            var array = totalExpression.map { String($0) }
            array.removeLast()
            array.append(sign)
            totalExpression = array.joined()
            return
        }
        addSubStackView()
        updateProperty(text: sign)
    }
    
    // 스크롤 뷰에 추가가 되는지 확인하기 위해 임시로 작성
    @IBAction func tapResultButton(_ sender: Any) {
        let subStackView = createSubStackView()
        let operatorLabel = createOperatorLabel(sign: "+")
        let operandLabel = createOperandLabel(operand: "123")
        
        subStackView.addArrangedSubview(operatorLabel)
        subStackView.addArrangedSubview(operandLabel)
        superStackView.addArrangedSubview(subStackView)
    }
    
    func checkRepeatZero(input: String) -> Bool {
        if input == "0" || input == "00" {
            return true
        }
        return false
    }
    
    func createSubStackView() -> UIStackView {
        let stackView: UIStackView = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.alignment = .fill
            stack.distribution = .fill
            stack.spacing = 8
            return stack
        }()
        return stackView
    }
    
    func createOperandLabel(operand: String) -> UILabel {
        let operandLabel: UILabel = {
            let label = UILabel()
            label.text = operand
            label.textColor = .white
            label.textAlignment = .right
            return label
        }()
        return operandLabel
    }
    
    func createOperatorLabel(sign: String) -> UILabel {
        let operatorLabel: UILabel = {
            let label = UILabel()
            label.text = sign
            label.textColor = .white
            label.textAlignment = .right
            return label
        }()
        return operatorLabel
    }
    
    func addSubStackView() {
        guard let sign = operatorLabel.text else { return }
        
        let subStackView = createSubStackView()
        let operatorLabel = createOperatorLabel(sign: sign)
        let operandLabel = createOperandLabel(operand: extraNumber)
            
        subStackView.addArrangedSubview(operatorLabel)
        subStackView.addArrangedSubview(operandLabel)
        superStackView.addArrangedSubview(subStackView)
    }
    
    func updateProperty(text: String) {
        extraNumber = ""
        totalExpression += text
        operatorLabel.text = text
        operandLabel.text = "0"
    }
}

