//
//  WeatherButtonView.swift
//  SwiftUI-WeatherApp
//
//  Created by Bekzhan Talgat on 30.06.2023.
//

import SwiftUI

struct WeatherButton: View {
    var titleLabel: String
    var titleColor: Color
    var backgroundColor: Color
    
    
    var body: some View {
        Text(titleLabel)
            .foregroundColor(titleColor)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .font(.system(size: 20, weight: .bold))
            .cornerRadius(10)
    }
}
