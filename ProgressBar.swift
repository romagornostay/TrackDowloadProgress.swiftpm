//
//  ProgressBar.swift
//  TrackDowloadProgress
//
//  Created by Роман Горностаев on 06.10.2023.
//

import SwiftUI

struct ProgressBar: View {
    
    var barTotal: Int64
    var barValue: Int64
    
    private var progress: Float { Float(barValue)/Float(barTotal) * 100 }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.secondary)
                .frame(height: 120)
            
            VStack(alignment: .leading) {
                
                Text("Dowload in progress...\(progress, format: .number.precision(.fractionLength(0)))%")
                
                statusLine.frame(height: 12)
                
                Text("\(barValue.formatToString()) of \(barTotal.formatToString()) ")
                
            }.padding(.horizontal)
        }
    }
    
    private var statusLine: some View {
        GeometryReader { screen in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(.orange.opacity(0.35))
                RoundedRectangle(cornerRadius: .infinity)
                    .foregroundColor(.orange)
                    .frame(width: screen.size.width * CGFloat(barValue) / CGFloat(barTotal))
            }
        }
    }
    
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(barTotal: 200, barValue: 90)
    }
}
