//
//  MainScreenView+FactoryMethods.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import SwiftUI

extension MainScreenView {
    
    // - MARK: Components
    
    @ViewBuilder
    /// - Returns a default button view
    /// - Parameters
    ///     - Parameter action: The button's action
    ///     - Parameter subview: The button's label
    func createDefaultButtonView<Content: View>(action: @escaping () -> Void, @ViewBuilder with subview: @escaping () -> Content) -> some View {
        Button(action: action) {
            subview()
        }
        .buttonStyle(.plain)
    }
    
    @ViewBuilder
    /// - Returns the `GalleryThumbnailPreview`
    /// - Parameter image: The image selected by the user
    func createGalleryThumbnailPreview(for image: UIImage) -> some View {
        Image(uiImage: image)
            .resizable()
            .frame(width: 48, height: 48)
            .cornerRadius(self.defaultCornerRadius / 2)
            .overlay {
                VStack(spacing: .zero) {
                    HStack(spacing: .zero) {
                        Spacer()
                        self.createDefaultButtonView(action: viewModel.removeSelectedImage) {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.white)
                                    .frame(width: 16, height: 16)

                                Image(systemName: self.filledCloseButtonImagePath)
                                    .resizable()
                                    .frame(width: 14, height: 14)
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(.white, .black)
                            }
                        }
                    }
                    Spacer()
                }
                .offset(x: 4, y: -4)
            }
    }
    
    // - MARK: Bottom Sheet
    
    @ViewBuilder
    /// - Returns the `SearchBarBottomSheetView`
    func createSearchBarBottomSheetView() -> some View {
        self.createBottomSheetView(for: self.searchBarView)
    }
    
    @ViewBuilder
    /// - Returns some View with the default sheet modifiers
    /// - Parameter contentView: The sheet's content view
    func createBottomSheetView<Content: View>(for contentView: @escaping @autoclosure () -> Content) -> some View {
        contentView()
            .presentationCornerRadius(self.defaultCornerRadius)
            .presentationDragIndicator(.hidden)
            .presentationBackground(.white)
            .presentationBackgroundInteraction(.enabled)
            .presentationDetents(self.viewModel.presentationDetents, selection: $viewModel.currentBottomSheetDetent)
            .ignoresSafeArea(.container, edges: .bottom)
            .dynamicTypeSize(...DynamicTypeSize.xxLarge)
            .interactiveDismissDisabled()
    }
}
