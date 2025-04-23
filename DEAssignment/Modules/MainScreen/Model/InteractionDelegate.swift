//
//  InteractionDelegate.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import struct SwiftUI.PresentationDetent

/// Protocol that delegates the `MainScreen` interactions
protocol InteractionDelegate {
    /// Sends the searched request
    func sendRequest()
    
    /// Dismisses the current screen
    func dismissCurrentScreen()
    
    /// Handles the chip action
    func handleChipAction()

    /// Indicates whether the `ImagePicker` should be displayed
    var shouldPresentImagePicker: Bool { get set }
    
    /// Indicates whether the `BottomSheet` should be displayed
    var shouldPresentBottomSheet: Bool { get set }
    
    /// Indicates whether the `BottomSheet` should be expanded
    var shouldExpandBottomSheet: Bool { get set }
    
    /// The current `BottomSheet` presentation detent
    var currentBottomSheetDetent: PresentationDetent { get set }
    
    /// The supported `BottomSheetDetents`
    var presentationDetents: BottomSheetDetents { get }
    
    /// Image path of the `resize` feature
    var resizeSearchInputImagePath: String { get}
    
    /// A collection of unique `PresentationDetents`
    associatedtype BottomSheetDetents where BottomSheetDetents == Set<PresentationDetent>
}

/// InteractionDelegate+DefaultImplementations
extension InteractionDelegate {
    
    // - MARK: Properties
    
    var presentationDetents: BottomSheetDetents {
        var availableDetents: BottomSheetDetents = [.fraction(0.16), .fraction(0.18)]
        if shouldExpandBottomSheet { availableDetents.insert(.large) }
        return availableDetents
    }
    
    var resizeSearchInputImagePath: String {
        (shouldExpandBottomSheet ? BottomSheetButton.reduce : BottomSheetButton.expand).imagePath
    }
    
    // - MARK: Stub methods
    
    func sendRequest() { /* ... */ }
    func dismissCurrentScreen() { /* ... */ }
    func handleChipAction() { /* ... */ }
}


