//
//  Classifier.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//

import SwiftUI
import CoreML

struct Classifier: View {
    
    @State private var Answer = ""
    @State var isImagePickerShowing = false
    
    var imageClassifier: MelClass_1?
    
    init(){
        do{
            imageClassifier = try MelClass_1(configuration: <#T##MLModelConfiguration#>)
        } catch{
            print(error)
        }
    }
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("beige")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack (){
                    Text("Welcome to our Melanoma Classifier!")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.8))
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom])
                    Text("Take or upload a picture of your suspicious lesions or moles to check for melanoma.")
                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                    }
                HStack(){
                    Button(action: {
                        
                    }) {
                        Text("Upload a Photo")
                    }
                    Button(action: {
                        
                    }) {
                        Text("Take a Photo")
                    }

                }.sheet(isPresented: <#T##Binding<Bool>#>, content: <#T##() -> View#>)
                    .frame(width: 350.0)
                    Button(action: {
                        Answer = "Melanoma"
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
                    if !Answer.isEmpty {
                        HStack{
                            Text(Answer) .multilineTextAlignment(.center)  .padding()
                        }
                    }
                    Text("The database for the image classifing model was aquired from the International Skin Imaging Collaboration, 2024")
                        .font(.caption2)
                        .padding(.top, 300.0)
                        .frame(width: 300.0, height: 400.0)
                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
            }
                
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
                    NavigationLink (destination: About().navigationBarBackButtonHidden(true)){
                        Text("About Us")
                            .font(.title3)
                            .foregroundColor(Color(red: 0.494, green: 0.02, blue: 0.371))
                            .multilineTextAlignment(.center)
                    }
                }
                .padding(.top)
            }
        }
      
    }

#Preview {
    Classifier()
}
