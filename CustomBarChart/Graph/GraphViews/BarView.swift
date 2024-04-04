//
//  BarView.swift
//  CustomBarChart
//
//  Created by Debanjan Chakraborty on 02/04/24.
//

import SwiftUI

struct BarView: View {
    var name: String
    var values: [Double]
    var scaleFactor: Double
    var axisDirection: AxisDirection = .vertical
    var barKeyData: [BarChartKeyDataItem]
    var displayValue: Bool

    var body: some View {
        GeometryReader { gr in
            let textWidth = gr.size.width * 0.75
            let padWidth = gr.size.width * 0.07
            HStack(spacing:0) {
                ForEach(values.indices, id: \.self) { i in
                    let barHeight = values[i] * scaleFactor
                    let valueString = displayValue ? "\(values[i])" : ""
                    VStack(spacing:0) {
                        Spacer()
                        Rectangle()
                            .fill(barColor(i))
                            .frame(height: CGFloat(barHeight), alignment: .trailing)
                            .overlay(
                                Text(valueString)
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .frame(width: textWidth)
                                    .rotationEffect(Angle(degrees: -90))
                                    .offset(y:15)
                                ,
                                alignment: .top
                            )
                    }
                }
            }
            .padding(.horizontal, padWidth)
            .animation(.easeInOut(duration: 0.5))
        }
    }

    private func barColor(_ index: Int) -> Color {
        guard barKeyData.indices.contains(index) else { return Color.clear }
        return barKeyData[index].keyColor
    }
}
