//
//  BarChartView.swift
//  CustomBarCharts
//
//  Created by Debanjan Chakraborty on 04/04/24.
//

import SwiftUI

struct BarChartView: View {
    var backGroundColor: Color = Color(#colorLiteral(red: 0.8906477705, green: 0.9005050659, blue: 0.8208766097, alpha: 1))
    var title: String
    var chartData: BarChartCollectiveDataModel
    var showYAxis: Bool
    var showXAxis: Bool
    var showHeaderSection: Bool
    var showGraphKeys: Bool
    var showValuesInBars: Bool
    var body: some View {
        let data = chartData.data
        GeometryReader { gr in
            let axisWidth = gr.size.width * (showYAxis ? 0.15 : 0.0)
            let axisHeight = gr.size.height * (showXAxis ? 0.1 : 0.0)
            let keyHeight = gr.size.height * (showGraphKeys ? 0.1 : 0.0)
            let headHeight = gr.size.height * (showHeaderSection ? 0.14 : 0.0)
            let fullChartHeight = gr.size.height - axisHeight - headHeight - keyHeight
            let maxValue = data.flatMap { $0.values }.max()!
            let tickMarks = AxisParameters.getTicks(top: Int(maxValue))
            let scaleFactor = (fullChartHeight * 0.95) / CGFloat(tickMarks[tickMarks.count-1])
            VStack(spacing:0) {
                if showHeaderSection {
                    BarChartHeaderView(title: title)
                        .frame(height: headHeight)
                }
                ZStack {
                    VStack(spacing:0) {
                        if showGraphKeys {
                            KeyView(keys: chartData.keys)
                                .frame(height: keyHeight)
                        }
                        HStack(spacing:0) {
                            if showYAxis {
                                AxisView(data: data,
                                         axisDirection: .vertical,
                                         ticks: tickMarks, scaleFactor: Double(scaleFactor))
                                    .frame(width:axisWidth, height: fullChartHeight)
                            }
                            BarChartAreaView(data: data,
                                          keyData: chartData.keys,
                                          scaleFactor: Double(scaleFactor),
                                          showValuesForBars: showValuesInBars)
                                .frame(height: fullChartHeight)
                        }
                        HStack(spacing:0) {
                            Rectangle()
                                .fill(Color.clear)
                                .frame(width:axisWidth, height:axisHeight)
                            if showXAxis {
                                AxisView(data: data,
                                         axisDirection: .horizontal,
                                         ticks: tickMarks, scaleFactor: Double(scaleFactor))
                                    .frame(height:axisHeight)
                            }
                        }
                    }
                }
                .background(backGroundColor)
            }
        }
    }
}
