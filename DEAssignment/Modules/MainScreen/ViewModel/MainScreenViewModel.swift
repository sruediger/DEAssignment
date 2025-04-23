//
//  MainScreenViewModel.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import UIKit
import struct SwiftUI.PresentationDetent

/// Object that handles the `MainScreenView` interactions
final class MainScreenViewModel: ObservableObject, InteractionDelegate {
    /// The `SearchBar`'s search query
    @Published var searchQuery: String
    /// The currently displayed text input font size
    @Published var currentFontSize: CGFloat
    /// The image selected by the user
    @Published var selectedImage: UIImage?
    /// Indicates whether the `ImagePicker` should be displayed
    @Published var shouldPresentImagePicker: Bool {
        willSet {
            guard !newValue else { return }
            self.shouldPresentBottomSheet = true
        }
    }
    /// Indicates whether the `BottomSheet` should be displayed
    @Published var shouldPresentBottomSheet: Bool
    /// Indicates whether the `BottomSheet` should be expanded
    @Published var shouldExpandBottomSheet: Bool
    /// The current `BottomSheet` presentation detent
    @Published var currentBottomSheetDetent: PresentationDetent {
        willSet {
            guard newValue == .fraction(0.16) else { return }
            self.shouldExpandBottomSheet = false
        }
    }
    /// The `TextField` height
    var searchInputHeight: CGFloat { !self.shouldExpandBottomSheet ? 50 : 220 }
    /// The `ChipStackView` bottom padding
    let chipStackPadding: CGFloat
    
    init(searchQuery: String = "", shouldPresentBottomSheet: Bool = true, selectedImage: UIImage? = nil, shouldPresentImagePicker: Bool = false, shouldExpandBottomSheet: Bool = false, currentBottomSheetDetent: PresentationDetent = .fraction(0.16), currentFontSize: CGFloat = 18, chipStackPadding: CGFloat = 160) {
        self.searchQuery = searchQuery
        self.currentFontSize = currentFontSize
        self.selectedImage = selectedImage
        self.shouldPresentImagePicker = shouldPresentImagePicker
        self.shouldPresentBottomSheet = shouldPresentBottomSheet
        self.shouldExpandBottomSheet = shouldExpandBottomSheet
        self.currentBottomSheetDetent = currentBottomSheetDetent
        self.chipStackPadding = chipStackPadding
    }
}
