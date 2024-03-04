//
//  RichTextKeyboardToolbar+Style.swift
//  RichTextKit
//
//  Created by Ryan Jarvis on 2024-02-24.
//


#if iOS || macOS || os(visionOS)
import SwiftUI

/// This struct can be used to style a `RichTextKeyboardToolbar`.
public struct RichTextKeyboardToolbarStyle {

    /**
     - Parameters:
       - toolbarHeight: The height of the toolbar, by default `50`.
       - itemSpacing: The spacing between toolbar items, by default `15`.
       - shadowColor: The toolbar's shadow color, by default transparent black.
       - shadowRadius: The toolbar's shadow radius, by default `3`.
     */
    public init(
        toolbarHeight: Double = 50,
        itemSpacing: Double = 15,
        shadowColor: Color = .black.opacity(0.1),
        shadowRadius: Double = 3
    ) {
        self.toolbarHeight = toolbarHeight
        self.itemSpacing = itemSpacing
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
    }

    /// The height of the toolbar.
    public var toolbarHeight: Double

    /// The spacing between toolbar items.
    public var itemSpacing: Double

    /// The toolbar's shadow color.
    public var shadowColor: Color

    /// The toolbar's shadow radius.
    public var shadowRadius: Double

    /// Default value
    static var standard: RichTextKeyboardToolbarStyle = .init()
}

/// This environment key defines a `RichTextKeyboardToolbar` style.
private struct RichTextKeyboardToolbarStyleKey: EnvironmentKey {
    public static var defaultValue: RichTextKeyboardToolbarStyle = .standard
}

public extension View {

    /// Apply a `RichTextKeyboardToolbar` style.
    func richTextKeyboardToolbarStyle(
        _ style: RichTextKeyboardToolbarStyle
    ) -> some View {
        self.environment(\.richTextKeyboardToolbarStyle, style)
    }
}

public extension EnvironmentValues {

    /// This environment value defines `RichTextKeyboardToolbar` styles.
    var richTextKeyboardToolbarStyle: RichTextKeyboardToolbarStyle {
        get { self [RichTextKeyboardToolbarStyleKey.self] }
        set { self [RichTextKeyboardToolbarStyleKey.self] = newValue }
    }
}

#endif
