//
//  ImagePicker.swift
//  Melanosight
//
//  Created by Suhaani Sodhi on 10/21/24.
//
 
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
   
    func makeUIViewController(context: Context) -> some UIViewController {
        
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
   
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
       
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            DispatchQueue.main.async {
                self.parent.selectedImage = image
            }
        }
        parent.isImagePickerShowing = false
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        parent.isImagePickerShowing = false
        
    }
    
    var parent: ImagePicker
        
        init(_ picker: ImagePicker) {
            self.parent = picker
        }
}
