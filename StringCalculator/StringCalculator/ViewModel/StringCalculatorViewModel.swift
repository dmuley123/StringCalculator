//
//  StringCalculatorViewModel.swift
//  StringCalculatorViewModel
//
//  Created by Dnyaneshwar Muley on 29/06/25.
//

import Foundation

enum StringCalculatorError: Error, LocalizedError {
    case negativeNumbers([Int])

    var errorDescription: String? {
        switch self {
        case .negativeNumbers(let numbers):
            return "Negative numbers not allowed: \(numbers.map(String.init).joined(separator: ", "))"
        }
    }
}

class StringCalculatorViewModel {
    func add(_ numbers: String) throws -> Int {
        guard !numbers.isEmpty else { return 0 }

        var delimiter = ","
        var input = numbers

        if numbers.hasPrefix("//") {
            let parts = numbers.split(separator: "\n", maxSplits: 1).map(String.init)
            delimiter = String(parts[0].dropFirst(2))
            input = parts[1]
        }

        let components = input
            .replacingOccurrences(of: "\n", with: delimiter)
            .split(separator: Character(delimiter))
            .map { Int($0) ?? 0 }

        let negatives = components.filter { $0 < 0 }
        if !negatives.isEmpty {
            throw StringCalculatorError.negativeNumbers(negatives)
        }

        return components.reduce(0, +)
    }
}
