//
//  ContentView.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Image("beige")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack (spacing: 20){
                    
                    Image("MelanoSight")
                        .frame(height: 200.0)
                        .padding(.bottom, 550)
                        .scaledToFill() // Scale the image to fill the width
                        .clipped()  // Clip any overflowing content from the scaled image
                        .edgesIgnoringSafeArea(.top)
                }
                VStack (spacing: 20){
                    Text(" Welcome To:")
                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                        .padding(.top, 200)
                    Text("MelanoSight")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.8))
                        .padding(.bottom)
                    HStack{
                        NavigationLink(destination: Classifier().navigationBarBackButtonHidden(true)) {
                            // Action for Clarssfier button
                            Text("Classifier")
                                .font(.title2)
                                .buttonStyle(.borderedProminent)
                                .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                                .foregroundColor(Color(red: 0.498, green: 0.02, blue: 0.371))
                                .multilineTextAlignment(.center)
                                .cornerRadius(25)
                                .frame(maxWidth: .infinity)
                            Spacer()
                            
                        }
                        
                        // Resoruces Button
                        NavigationLink(destination: Resources().navigationBarBackButtonHidden(true)){
                            // Action for Resoruces button
                            Text("Information")
                                .font(.title2)
                                .multilineTextAlignment(.center)
                                .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                                .foregroundColor(Color(red: 0.498, green: 0.02, blue: 0.371))
                                .frame(maxWidth: .infinity)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                                .padding(.horizontal)
                        }
                        
                    }
                    NavigationLink(destination: About().navigationBarBackButtonHidden(true)) {
                        // Action for Find Out More button
                        Text("About Us")
                            .font(.title2)
                            .multilineTextAlignment(.center)
                            .tint(Color(red: 0.897, green: 0.644, blue: 0.796))
                            .foregroundColor(Color(red: 0.498, green: 0.02, blue: 0.371))
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .cornerRadius(25)
                            .padding(.horizontal)
                    }
                    Text("An inexpensive, accessible, and easy-to-use tool for preliminary melanoma screenings to increase awareness and access to healthcare!")
                        .font(.subheadline)
                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                        .multilineTextAlignment(.center)
                    Text("This app functions primarily as a preliminary. It does not replace a medical diagnosis.")
                        .font(.footnote)
                        .fontWeight(.black)
                        .foregroundColor(Color(red: 0.704, green: 0.401, blue: 0.798))
                        .multilineTextAlignment(.center)
                        .padding(.top, 100.0)
                }
                .frame(width: 300.0)
                Spacer()
                
            }
        }
    }
    
}
#Preview {
    ContentView()
}
