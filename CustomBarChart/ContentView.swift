//
//  ContentView.swift
//  CustomBarChart
//
//  Created by Debanjan Chakraborty on 02/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingYAxis = false
    @State private var isShowingXAxis = true
    @State private var isShowingHeading = true
    @State private var isShowingKey = true
    @State private var isShowingValuesInBars = true
    let chartData = BarChartCollectiveDataModel(
        keys: [
            BarChartKeyDataItem(keyName: "Male", keyColor: .blue),
            BarChartKeyDataItem(keyName: "Female", keyColor: .pink)
        ],
        data: [
            BarChartDataItem(name: "Sample Item 1", values: [126.5, 112.45]),
            BarChartDataItem(name: "Sample Item 2", values: [100.89, 130]),
            BarChartDataItem(name: "Sample Item 3", values: [140.50, 112.32]),
            BarChartDataItem(name: "Sample Item 4", values: [90, 110.89]),
            BarChartDataItem(name: "Sample Item 5", values: [120, 130.45])
        ])
    var body: some View {
        ScrollView() {
            VStack {
                VStack {
                    Spacer()
                        .frame(height:20)
                    BarChartView(
                        title: "Sample Header for Graph",
                        chartData: chartData,
                        showYAxis: isShowingYAxis,
                        showXAxis: isShowingXAxis,
                        showHeaderSection: isShowingHeading,
                        showGraphKeys: isShowingKey,
                        showValuesInBars: isShowingValuesInBars)
                    .animation(.spring(), value: 0.5)
                    .frame(width: 400, height: 500, alignment: .center)
                    Spacer()
                        .frame(height:50)
                    VStack {
                        Text("Chart Settings")
                            .font(.title2)
                        Toggle("Show Y axis", isOn: $isShowingYAxis)
                        Toggle("Show X axis", isOn: $isShowingXAxis)
                        Toggle("Show heading", isOn: $isShowingHeading)
                        Toggle("Show Key", isOn: $isShowingKey)
                        Toggle("Show Values inside Bars", isOn: $isShowingValuesInBars)
                    }
                    .padding(.horizontal, 50)
                    Spacer()
                }
            }
        }
    }
}

