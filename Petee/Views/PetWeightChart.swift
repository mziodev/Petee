//
//  PetWeightChart.swift
//  Petee
//
//  Created by MZiO on 23/5/24.
//

import Charts
import SwiftUI

struct PetWeightChart: View {
    let weights: [Weight]
    
    var body: some View {
        Chart {
            ForEach(weights) { weight in
                BarMark(
                    x: .value("Date", weight.date.formatted(date: .abbreviated, time: .omitted)),
                    y: .value("Weight", weight.value)
                )
                .annotation(position: .top) {
                    Text("\(weight.value.formatted())kg")
                        .font(.caption)
                }
            }
        }
        .chartScrollableAxes(.horizontal)
        .chartXVisibleDomain(length: weights.count)
    }
}

#Preview {
    PetWeightChart(weights: SampleData.shared.pet.reverseSortedWeights)
        .frame(height: 240)
        .padding()
}