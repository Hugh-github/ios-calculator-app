//
//  ExpressionParser.swift
//  Calculator
//
//  Created by dhoney96 on 2022/05/20.
//

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var formula = Formula()
        
        input.filter {
            Double(String($0)) == nil
        }.forEach {
            guard let sign = Operator(rawValue: $0) else { return }
            formula.operators.enqueue(sign)
        }
        
        componentsByOperators(from: input).compactMap {
            Double($0)
        }.forEach {
            formula.operands.enqueue($0)
        }
        
        return formula
    }
    
    static private func componentsByOperators(from input: String) -> [String] {
        var newInput = input
            
        let sign = Operator.allCases.map {
            $0.rawValue
        }
        sign.forEach {
            newInput = newInput.replacingOccurrences(of: String($0), with: " ")
        }
        return newInput.split(with: " ")
    }
}
