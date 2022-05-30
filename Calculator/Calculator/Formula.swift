//
//  Formula.swift
//  Calculator
//
//  Created by bard, hugh on 2022/05/30.
//

struct Formula {
    var operands = CalculatorItemQueue<Double>()
    var operators = CalculatorItemQueue<Operator>()
    
    mutating func result() throws -> Double {
        guard operands.items.count > operators.items.count,
              var total = operands.dequeue() else {
            throw CalculatorError.emptyError
        }
        
        for _ in 1...operators.items.count {
            guard let number = operands.dequeue() else { throw CalculatorError.emptyError }
            guard let symbol = operators.dequeue() else { throw CalculatorError.emptyError }
            
            if symbol == .divide && number == 0.0 {
                throw CalculatorError.divideError
            }
            
            total = symbol.calculate(lhs: total, rhs: number)
        }
        return total
    }
}
