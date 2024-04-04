//
//  AxisParameters.swift
//  CustomBarCharts
//
//  Created by Debanjan Chakraborty on 04/04/24.
//

import Foundation

struct AxisParameters {
    // The ticks are the number of axes scales required
    // The step is the counter that is used to increment the scale for the axis
    static func getTicks(top:Int, step: Int = 50) -> [Int] {
        var high = top
        high = ((top/step) * step) + step + step
        var ticks:[Int] = []
        for i in stride(from: 0, to: high, by: step) {
            ticks.append(i)
        }
        return ticks
    }
}
