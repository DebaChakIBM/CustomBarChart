//
//  BarChartHeaderView.swift
//  CustomBarCharts
//
//  Created by Debanjan Chakraborty on 04/04/24.
//

import SwiftUI

struct BarChartHeaderView: View {
    var title: String
    var body: some View {
        VStack {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
    }
}
