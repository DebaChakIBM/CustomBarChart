//
//  KeyView.swift
//  CustomBarChart
//
//  Created by Debanjan Chakraborty on 02/04/24.
//

import SwiftUI

struct KeyView: View {
    let keys: [BarChartKeyDataItem]
    var body: some View {
        HStack {
            ForEach(keys.indices, id: \.self) { i in
                let selectedKey = keys[i]
                HStack(spacing:0) {
                    selectedKey.keyImage
                        .foregroundColor(selectedKey.keyColor)
                    Text("\(selectedKey.keyName)")
                }
                .font(.footnote)
            }
        }
    }
}
