//
//  Decimal+Utils.swift
//  Banker
//
//  Created by Артём Дмитриев on 02.02.2023.
//

import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
