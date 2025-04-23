//
//  MainScreen.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import protocol SwiftUI.View

/// Protocol that defines the `MainScreen`
protocol MainScreen: View, DesignSystem {
    /// The `NavigationView` title
    var title: String { get }
    
    /// The subtitle presented on the chips
    var chipSubtitle: String { get }
    
    /// Image path of the `CloseButton`
    var closeButtonImagePath: String { get }
    
    /// Image path of the `CloseButton` with a `.fill` modifier
    var filledCloseButtonImagePath: String { get }
}

/// MainScreen+DefaultImplementations
extension MainScreen {
    var title: String { "Some Text" }
    var chipSubtitle: String { "Some More Text" }
    var closeButtonImagePath: String { "xmark" }
    var filledCloseButtonImagePath: String { closeButtonImagePath.appending(".circle.fill") }
}
