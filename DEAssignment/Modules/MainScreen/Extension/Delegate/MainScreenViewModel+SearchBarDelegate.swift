//
//  MainScreenViewModel+SearchBarDelegate.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import UIKit

extension MainScreenViewModel: SearchBarDelegate {
    /// Resizes the search input
    func resizeSearchInput() {
        self.shouldExpandBottomSheet.toggle()
        self.currentBottomSheetDetent = self.shouldExpandBottomSheet ? .large : .fraction(0.16)
    }
    
    /// Updates the `SearchBar`'s font size
    func updateSearchBarFontSize() {
        self.currentFontSize = self.searchBarFontSize
    }
    
    /// The `SearchBar`'s font size
    private var searchBarFontSize: CGFloat {
        let fontSizes: [CGFloat] = [18, 16, 14]
        
        for font in fontSizes {
            let height = self.getTextHeight(for: self.searchQuery, fontSize: font)
            let ratio = height / self.searchInputHeight
            
            if ratio <= 0.66 {
                return font
            }
        }
        
        return 14
    }

    /// - Returns the `SearchBar` text height
    /// - Parameters
    ///     - Parameter text: The user input
    ///     - Parameter fontSize: The current font size
    private func getTextHeight(for text: String, fontSize: CGFloat) -> CGFloat {
        guard !text.isEmpty else { return 0 }
        
        let font = UIFont.systemFont(ofSize: fontSize)
        let width: CGFloat = UIScreen.main.bounds.width - 32
        
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = NSString(string: text).boundingRect(
            with: constraintRect,
            options: [.usesLineFragmentOrigin, .usesFontLeading],
            attributes: [.font: font],
            context: nil
        )
        
        return ceil(boundingBox.height)
    }
}
