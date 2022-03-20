//
//  Extension.swift
//  ArrayFlags
//
//  Created by 김수환 on 2022/03/19.
//

import SwiftUI
import Foundation

extension Dictionary where Value: Equatable {
    public func findKey(forValue val: Value) -> Key? {
        return first(where: { $1 == val })?.key
    }
}
