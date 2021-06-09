//
//  Strings+Helpers.swift
//  Kinzoo
//
//  Created by Manuel Cubillo on 6/8/21.
//

import Foundation

extension String {
    func capitilizeFirst() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
