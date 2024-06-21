//
//  DewormingListRow.swift
//  Pets
//
//  Created by MZiO on 20/6/24.
//

import SwiftUI

struct DewormingTreatmentListRow: View {
    let dewormingTreatment: DewormingTreatment
    
    private let daysRange = 7...15
    private var isTreatmentExpired: Bool {
        dewormingTreatment.activeDays < 1
    }
    
    var activeTreatmentDaysColor: Color {
        if dewormingTreatment.activeDays < 7 {
            return .red
        } else if daysRange.contains(dewormingTreatment.activeDays) {
            return .yellow
        } else {
            return .green
        }
    }
    
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(dewormingTreatment.name)
                    .font(.headline)
                
                Text(
                    dewormingTreatment.startingDate.formatted(
                        date: .abbreviated,
                        time: .omitted
                    )
                )
                .font(.subheadline)
                .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            if isTreatmentExpired {
                Text("Expired")
                    .font(.title3.smallCaps())
            } else {
                VStack(alignment: .center) {
                    Text("\(dewormingTreatment.activeDays)")
                        .font(.title3)
                        .fontDesign(.serif)
                        .bold()
                        .foregroundStyle(activeTreatmentDaysColor)
                    
                    Text("more days")
                        .font(.caption2.lowercaseSmallCaps())
                }
            }
        }
        .foregroundStyle(isTreatmentExpired ? .secondary : .primary)
    }
}


#Preview("Active deworming") {
    List {
        DewormingTreatmentListRow(dewormingTreatment: DewormingTreatment.sampleData[0])
    }
}

#Preview("Expired deworming") {
    List {
        DewormingTreatmentListRow(dewormingTreatment: DewormingTreatment.sampleData[3])
    }
}