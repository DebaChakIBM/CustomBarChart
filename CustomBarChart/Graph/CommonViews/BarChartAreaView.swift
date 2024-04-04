//
//  BarChartAreaView.swift
//  CustomBarCharts
//
//  Created by Debanjan Chakraborty on 04/04/24.
//

import SwiftUI

struct BarChartAreaView: View {
    var data: [BarChartDataItem]
    var keyData: [BarChartKeyDataItem]
    var scaleFactor: Double
    var showValuesForBars: Bool
    var body: some View {
        ZStack {
            VStack {
                HStack(spacing:0) {
                    ForEach(data) { item in
                        BarView(
                            name: item.name,
                            values: item.values,
                            scaleFactor: scaleFactor,
                            axisDirection: AxisDirection.vertical,
                            barKeyData: keyData,
                            displayValue: showValuesForBars)
                    }
                }
            }
        }
    }
}
