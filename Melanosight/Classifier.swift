//
//  Classifier.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//

import SwiftUI

struct Classifier: View {
    
    @State private var Answer = ""
    
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
                        .padding(.bottom)
                    Text("Take or upload a picture of your suspicious lesions or moles to check for melanoma.")
                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                    
                    func createImageClassifier() -> VNCoreMLModel {
                        // Use a default model configuration.
                        let defaultConfig = MLModelConfiguration()


                        // Create an instance of the image classifier's wrapper class.
                        let imageClassifierWrapper = try? MelClass_1(configuration: defaultConfig)


                        guard let imageClassifier = imageClassifierWrapper else {
                            fatalError("App failed to create an image classifier model instance.")
                        }


                        // Get the underlying model instance.
                        let imageClassifierModel = imageClassifier.model


                        // Create a Vision instance using the image classifier's model instance.
                        guard let imageClassifierVisionModel = try? VNCoreMLModel(for: imageClassifierModel) else {
                            fatalError("App failed to create a `VNCoreMLModel` instance.")
                        }


                       
                    }
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
                .frame(width: 350.0)
                
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
}

#Preview {
    Classifier()
}
