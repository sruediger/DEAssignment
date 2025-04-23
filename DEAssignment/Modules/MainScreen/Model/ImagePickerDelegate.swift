//
//  ImagePickerDelegate.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

/// Protocol that delegates the `ImagePicker` interactions
protocol ImagePickerDelegate {
    /// Opens the camera roll
    func openCameraRoll()
    
    /// Removes the selected image
    func removeSelectedImage()
}
