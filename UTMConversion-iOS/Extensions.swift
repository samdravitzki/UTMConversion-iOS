//
//  Extensions.swift
//  UTMConversion-iOS
//
//  Created by Sam Dravizki on 7/07/20.
//  Copyright © 2020 Sam Dravizki. All rights reserved.
//

import Foundation

extension Double {
    func roundToDecimal(_ fractionDigits: Int) -> Double {
        let multiplier = pow(10, Double(fractionDigits))
        return Darwin.round(self * multiplier) / multiplier
    }
}
