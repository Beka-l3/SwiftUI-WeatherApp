//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Bekzhan Talgat on 30.06.2023.
//

import SwiftUI

struct WeatherDayModel {
    let dayOfWeek: String
    let systemImageName: String
    let temperature: Int
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ContentView: View {
    
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundGradient(isNight: $isNight)
            
            VStack {
                CityLabel(cityName: "Innopolis, RT")
                
                MainWeatherInfo(
                    systemIageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                    temperature: 22
                )
                .padding(.bottom, 48)
                
                HStack(spacing: 28) {
                    WeatherDayView(dayOfWeek: "TUE", imageSystemName: "tornado", temperature: 24)
                    WeatherDayView(dayOfWeek: "WED", imageSystemName: "cloud.bolt.rain.fill", temperature: 1)
                    WeatherDayView(dayOfWeek: "THU", imageSystemName: "cloud.sun.rain.fill", temperature: 5)
                    WeatherDayView(dayOfWeek: "FRI", imageSystemName: "wind", temperature: -12)
                    WeatherDayView(dayOfWeek: "SUN", imageSystemName: "thermometer.sun.fill", temperature: 99)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(
                        titleLabel: "Day & Night",
                        titleColor: isNight ? Color("BlueBottom") : .black,
                        backgroundColor: isNight ? .black : .white
                    )
                    
                }
                
                Spacer()
            }
            
        }
    }
}


struct BackgroundGradient: View {
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: [isNight ? .black : .init("BlueTop"), isNight ? .gray : .init("BlueBottom")],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityLabel: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherInfo: View {
    var systemIageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: systemIageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String = "day"
    var imageSystemName: String = "cloud.sun.fill"
    var temperature: Int = 22
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageSystemName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

