//
//  CameraRollView.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import SwiftUI
import PhotosUI

/// The system's built-in `CameraRollView`
struct CameraRollView: UIViewControllerRepresentable {
    /// The image selected by the user
    @Binding var selection: UIImage?

    func makeUIViewController(context: Context) -> PHPickerViewController {
        var config = PHPickerConfiguration()
        config.filter = .images
        config.selectionLimit = 1

        let picker = PHPickerViewController(configuration: config)
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

    func makeCoordinator() -> Coordinator { Coordinator(self) }

    class Coordinator: NSObject, PHPickerViewControllerDelegate {
        let parent: CameraRollView

        init(_ parent: CameraRollView) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            guard let provider = results.first?.itemProvider, provider.canLoadObject(ofClass: UIImage.self) else { return }

            provider.loadObject(ofClass: UIImage.self) { image, _ in
                DispatchQueue.main.async {
                    self.parent.selection = image as? UIImage
                }
            }
        }
    }
}
