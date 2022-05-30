//
//  Queue.swift
//  Calculator
//
//  Created by Hugh,bard on 2022/05/30.
//

protocol Queue {
    associatedtype T

    mutating func enQueue(_ T: T)
    mutating func deQueue() throws -> T
    mutating func clearAllStacks()
}
