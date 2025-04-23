//
//  BottomSheetButton.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

/// An interactive button displayed on the `BottomSheet`
enum BottomSheetButton {
    case gallery, send, expand, reduce
    
    /// The button's image path
    var imagePath: String {
        switch self {
            case .gallery: return "photo.fill"
            case .send: return "paperplane.fill"
            case .expand: return "arrow.up.backward.and.arrow.down.forward"
            case .reduce: return "arrow.down.forward.and.arrow.up.backward"
        }
    }
}
