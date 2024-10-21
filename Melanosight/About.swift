//
//  About.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//

import SwiftUI
import MapKit

struct About: View {
    var body: some View {
         NavigationView{
            ZStack{
                Image("beige")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack (){
                    Text("About Us!")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.8))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 00.0)
                    HStack{
                        Image("Profile")
                            .resizable()
                            .padding(.bottom)
                            .frame(width: 150.0, height: 250.0)
                            .clipShape(Circle())
                        
                        VStack{
                            Text("Meet our Founder!")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(Color(red: 0.272, green: 0.022, blue: 0.181))
                            Text("Suhaani is a senior in high school and an Arizona resident. She first hand has seen the effects of Melanoma and hopes to combat them by raising healthcare acesibility through MelanoSight!")
                                .foregroundColor(Color(red: 0.272, green: 0.022, blue: 0.181))
                                .frame(width: 200.0)
                        }
                    }
                   
                Link("Visit her website!", destination: URL(string: "https://95788dbd-07f4-4f49-8f3f-82a91cb71af5-00-rspxhyqiz2ep.picard.replit.dev/index.html")!)
                        .font(.headline)
                                   .foregroundColor(.blue)
                                   .padding()
                }
                .padding(.bottom, 250.0)
                HStack(alignment: .bottom){
                    NavigationLink (destination: ContentView().navigationBarBackButtonHidden(true)){
                        Text("Home")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                            .multilineTextAlignment(.center)
                    }
                    NavigationLink (destination: Resources().navigationBarBackButtonHidden(true)){
                        Text("Information")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                            .multilineTextAlignment(.center)
                    }
                    NavigationLink (destination: Classifier().navigationBarBackButtonHidden(true)){
                        Text("Classifier")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                            .multilineTextAlignment(.center)
                    }
                }

            }
         
        }
        
    }
}

#Preview {
    About()
}
