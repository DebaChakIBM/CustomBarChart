//
//  AxisViews.swift
//  CustomBarChart
//
//  Created by Debanjan Chakraborty on 02/04/24.
//

import Foundation
import SwiftUI

enum AxisDirection {
    case vertical
    case horizontal
}

struct AxisView: View {
    var data: [BarChartDataItem]
    var axisDirection: AxisDirection = .horizontal
    var ticks: [Int]
    var scaleFactor: Double

    var body: some View {
        GeometryReader { gr in
            switch axisDirection {
                case .vertical:
                    verticalAxis(gr)
                case .horizontal:
                    horizontalAxis(gr)
            }
        }
    }

    private func horizontalAxis(_ proxy: GeometryProxy) -> some View {
        let labelWidth = (proxy.size.width * 0.9) / CGFloat(data.count)
        let padWidth = (proxy.size.width * 0.05) / CGFloat(data.count)
        return ZStack {
            // x axis line
            Rectangle()
                .fill(Color.black)
                .frame(height: 1.5)
                .offset(x: 0, y: -(proxy.size.height/2.0))
            HStack(spacing:0) {
                ForEach(data) { item in
                    Text(item.name)
                        .font(.footnote)
                        .frame(width:labelWidth, height: proxy.size.height)
                }
                .padding(.horizontal, padWidth)
            }
        }
    }

    private func verticalAxis( _ proxy: GeometryProxy) -> some View {
        let fullChartHeight = proxy.size.height
        return ZStack {
            // y-axis line
            Rectangle()
                .fill(Color.black)
                .frame(width:1.5)
                .offset(x: (proxy.size.width/2.0)-1, y: 1)
            // Tick marks
            ForEach(ticks, id:\.self) { t in
                HStack {
                    Spacer()
                    Text("\(t)")
                        .font(.footnote)
                    Rectangle()
                        .frame(width: 10, height: 1)
                }
                .offset(y: (fullChartHeight/2.0) - (CGFloat(t) * CGFloat(scaleFactor)))
            }
        }
    }
}
