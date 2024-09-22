//
//  Resources.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//

import SwiftUI

struct Resources: View {
    var body: some View {
        VStack (){
            Text("Welcome to our Melanoma Classifier!")
                .font(.largeTitle)
                .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.8))
                .padding(.bottom)
            Text("Take or upload a picture of your suspicious lesions or moles to check for melanoma.")
            Button(action: {
                // Action for Classify button
            }) {
                Text("Classify!")
                    .font(.title2)
                    .padding()
                    .frame(width: 150.0)
                    .background(Color.purple)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal)
            }
        }
    }
    }

#Preview {
    Resources()
}
