//
//  WeightListRow.swift
//  Pets
//
//  Created by MZiO on 12/6/24.
//

import SwiftUI

struct WeightListRow: View {
    let weight: Weight

    var body: some View {
        HStack {
            Text(weight.date.formatted(date: .complete, time: .omitted))
            
            Spacer()
            
            Text("\(weight.value.formatted()) \(Weight.units)")
                .font(.title3)
                .fontDesign(.rounded)
                .bold()

        }
    }
}

#Preview {
    List {
        WeightListRow(
            weight: SampleData.shared.petWithChipID.sortedWeights[2]
        )
    }
}
