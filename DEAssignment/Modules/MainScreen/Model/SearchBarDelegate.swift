//
//  SearchBarDelegate.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

/// Protocol that delegates the `SearchBar` interactions
protocol SearchBarDelegate {
    /// Resizes the search input
    func resizeSearchInput()
    
    /// Updates the `SearchBar`'s font size
    func updateSearchBarFontSize()
    
    /// The `SearchBar` placeholder
    var searchBarPlaceholder: String { get }
}

/// SearchBarDelegate+DefaultImplementations
extension SearchBarDelegate {
    var searchBarPlaceholder: String { "Start typing..." }
}
