//
//  Comparable+Clamped.swift
//  Cadence DJ
//
//  Created by Daniel Luo on 8/13/25.
//

extension Comparable {
    func clamped(to range: ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
}
