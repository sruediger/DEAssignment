//
//  MainScreenViewModel+ImagePickerDelegate.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

extension MainScreenViewModel: ImagePickerDelegate {
    /// Opens the camera roll
    func openCameraRoll() {
        self.shouldPresentBottomSheet = false
        self.shouldPresentImagePicker = true
    }
        
    /// Removes the selected image
    func removeSelectedImage() {
        self.selectedImage = nil
    }
}
