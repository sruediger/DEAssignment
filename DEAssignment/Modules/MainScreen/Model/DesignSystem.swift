//
//  DesignSystem.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import Foundation

import struct CoreGraphics.CGFloat

/// Protocol that defines common properties used to compose the app's design system
public protocol DesignSystem {
    /// App's default spacing
    var defaultSpacing: CGFloat { get }
    /// App's default padding
    var defaultPadding: CGFloat { get }
    /// App's dafault corner radius
    var defaultCornerRadius: CGFloat { get }
}

/// DesignSystem+DefaultImplementations
public extension DesignSystem {
    // Override for further customization
    var defaultSpacing: CGFloat { 10 }
    var defaultPadding: CGFloat { defaultSpacing }
    var defaultCornerRadius: CGFloat { 16 }
}
