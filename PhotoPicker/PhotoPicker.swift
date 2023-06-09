//
//  PhotoPicker.swift
//  PhotoPicker
//
//  Created by junior leoncio on 25/04/23.
//

import SwiftUI

struct PhotoPicker: UIViewControllerRepresentable {
    
    @Binding var avatarImage: UIImage
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(photoPicker: self)
    }
    
    final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        
        let photoPicker: PhotoPicker
        
        init(photoPicker: PhotoPicker) {
            self.photoPicker = photoPicker
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.editedImage] as? UIImage {
                guard let data = image.jpegData(compressionQuality: 0.1), let compressedImage = UIImage(data: data) else {
                    // error
                    return
                }
                photoPicker.avatarImage = compressedImage
            } else {
                // eroor
            }
            picker.dismiss(animated: true)
        }
        
    }
    
}
