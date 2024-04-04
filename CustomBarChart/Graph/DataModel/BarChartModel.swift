//
//  BarChartModel.swift
//  CustomBarChart
//
//  Created by Debanjan Chakraborty on 02/04/24.
//

import SwiftUI

struct BarChartDataItem: Identifiable {
    let name: String
    let values: [Double]
    let id = UUID()
}

struct BarChartCollectiveDataModel {
    let keys: [BarChartKeyDataItem]
    let data: [BarChartDataItem]
}

struct BarChartKeyDataItem {
    let keyName: String
    let keyColor: Color
    let keyImage = Image(systemName: "square.fill")
}
