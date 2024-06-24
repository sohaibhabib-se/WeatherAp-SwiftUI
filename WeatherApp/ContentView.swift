//
//  ContentView.swift
//  WeatherApp
//
//  Created by Muhammad Sohaib on 24/06/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isDayTime: Bool = true
    
    var body: some View {
        ZStack{
//            Color(.blue).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            LinearGradient(gradient: Gradient(colors: [isDayTime ? Color.blue : Color.black, isDayTime ? Color("lightBlue"): Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 100) {
                Text("London")
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                
                VStack(spacing: 4) {
                    Image(systemName: isDayTime ? "cloud.sun.fill" :"moon.stars")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("20°")
                        .font(.system(size: 36))
                        .foregroundColor(.white)
                }
                
                HStack {
                    DayWeatherContainer(dayName: "MON", imageName: isDayTime ? "cloud.sun.fill" : "moon.stars", degreesTemperature: 23)
                    DayWeatherContainer(dayName: "TUE", imageName: "sun.max.fill", degreesTemperature: 33)
                    DayWeatherContainer(dayName: "WED", imageName: "wind.snow", degreesTemperature: 8)
                    DayWeatherContainer(dayName: "THU", imageName: "sunset.fill", degreesTemperature: 23)
                    DayWeatherContainer(dayName: "FRI", imageName: "snow", degreesTemperature: 3)
                    DayWeatherContainer(dayName: "MON", imageName: "cloud.sun.fill", degreesTemperature: 31)
                }
                Spacer()
                
                Button(action: {
                    isDayTime = !isDayTime
                }, label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold))
                        .cornerRadius(10)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct DayWeatherContainer: View {
    
    let dayName: String
    let imageName: String
    let degreesTemperature: Int
    var body: some View {
        VStack(spacing: 8) {
            Text(dayName)
                .font(.system(size: 20))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            
            Text("\(degreesTemperature)°")
                .font(.system(size: 20))
                .foregroundColor(.white)
        }
    }
}
