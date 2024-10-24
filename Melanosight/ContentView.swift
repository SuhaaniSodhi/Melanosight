//
//  ContentView.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 9/21/24.
//
import SwiftUI
import CoreML

extension UIImage {
    func toCVPixelBuffer() -> CVPixelBuffer? {
        let attrs = [kCVPixelBufferCGImageCompatibilityKey: kCFBooleanTrue, kCVPixelBufferCGBitmapContextCompatibilityKey: kCFBooleanTrue] as CFDictionary
        var pixelBuffer : CVPixelBuffer?
        let status = CVPixelBufferCreate(kCFAllocatorDefault, Int(self.size.width), Int (self.size.height), kCVPixelFormatType_32ARGB, attrs, &pixelBuffer)
        guard (status == kCVReturnSuccess) else {
            return nil
        }
        CVPixelBufferLockBaseAddress(pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
        let pixelData = CVPixelBufferGetBaseAddress(pixelBuffer!)
        
        let rgbColorSpace = CGColorSpaceCreateDeviceRGB()
        let context = CGContext(data: pixelData, width: Int(self.size.width), height: Int (self.size.height), bitsPerComponent: 8, bytesPerRow: CVPixelBufferGetBytesPerRow(pixelBuffer!), space: rgbColorSpace, bitmapInfo:
        CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        UIGraphicsPushContext(context!)
        self.draw(in: CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height))
        UIGraphicsPopContext()
        CVPixelBufferUnlockBaseAddress (pixelBuffer!, CVPixelBufferLockFlags(rawValue: 0))
    }
}

struct ContentView: View {
    
    @State private var Answer = ""
    @State var isImagePickerShowing = false
    @State var selectedImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
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
                VStack(){
                    Text("Welcome to our Melanoma Classifier!")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.7, green: 0.4, blue: 0.8))
                        .multilineTextAlignment(.center)
                        .padding([.leading, .bottom])
                        .frame(width: 400.0)
                  
                    Text("Take or upload a picture of your suspicious lesions or moles to check for melanoma.")
                        .foregroundColor(Color(red: 0.271, green: 0.022, blue: 0.181))
                        .padding(.vertical)
                        .frame(width: 400.0)
                  
                    Image(uiImage: selectedImage ?? UIImage(named: "Camera")!)
                        .frame(width: 225.0, height: 225.0)
               
                    HStack(){
                        Button(action: {
                            self.sourceType = .photoLibrary
                            isImagePickerShowing = true
                        }) {
                            Text("Upload a Photo")
                        }
                      
                        Button(action: {
                            isImagePickerShowing = true
                        }) {
                            Text("Take a Photo")
                        }
                        
                    }
                    .frame(width: 350.0)
                  
                    Button(action: {
                        guard let uiImage = UIImage(named: "Camera") else{
                            return
                        }
                        
                        guard let pixelBuffer = selectedImage?.toCVPixelBuffer() else { return }
                        do {
                            let result = try imageClassifier!.prediction(image: pixelBuffer)
                            Answer = result?.classLabel??
                        } catch{
                            print(error)
                        }
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
                .sheet(isPresented: $isImagePickerShowing) {
                    ImagePicker(selectedImage: $selectedImage, isImagePickerShowing: $isImagePickerShowing, sourceType: self.sourceType)
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
    }

#Preview {
    Classifier()
}
