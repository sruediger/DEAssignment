//
//  MainScreenView+Components.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import SwiftUI

extension MainScreenView {
    
    /// The `ChipStackView`
    var chipStackView: some View {
        ScrollView(.horizontal) {
            let screenSize = UIScreen.main.bounds
            HStack(spacing: self.defaultSpacing) {
                ForEach(0..<10) { _ in
                    self.createDefaultButtonView(action: viewModel.handleChipAction) {
                        Capsule()
                            .foregroundStyle(.white)
                            .frame(width: screenSize.width * 0.36, height: screenSize.height * 0.08)
                            .shadow(radius: 2)
                            .overlay {
                                VStack(alignment: .leading, spacing: self.defaultSpacing / 2) {
                                    Text(self.title)
                                        .font(.system(.headline))
                                        .minimumScaleFactor(0.8)
                                        .lineLimit(1)

                                    Text(self.chipSubtitle)
                                        .font(.system(.subheadline))
                                        .minimumScaleFactor(0.8)
                                        .lineLimit(1)
                                }
                            }
                            .foregroundStyle(.black)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .scrollIndicators(.hidden)
        .contentMargins(16, for: .scrollContent)
    }
    
    // - MARK: Bottom Sheet Components
    
    /// The expandable `TextField` view
    var expandableTextView: some View {
        HStack(spacing: self.defaultSpacing) {
            let emptySearchQuery = viewModel.searchQuery.isEmpty
            TextField(viewModel.searchBarPlaceholder, text: $viewModel.searchQuery, axis: .vertical)
                .font(.system(size: viewModel.currentFontSize))
                .frame(height: viewModel.searchInputHeight, alignment: .top)
                .scrollIndicators(viewModel.searchInputScrollVisibility, axes: .vertical)
                .onChange(of: viewModel.searchQuery) { viewModel.updateSearchBarFontSize() }
                .animation(.smooth, value: viewModel.currentFontSize)
                .padding([.leading, .top])
                .lineLimit(10)
            
            if !emptySearchQuery {
                VStack(spacing: .zero) {
                    self.createDefaultButtonView(action: self.viewModel.resizeSearchInput) {
                        Image(systemName: viewModel.resizeSearchInputImagePath)
                    }
                    if viewModel.shouldExpandBottomSheet {
                        Spacer()
                    }
                }
                .transition(
                    .scale
                        .combined(with: .opacity)
                        .combined(with: .identity)
                    .animation(.smooth)
                )
                .padding([.vertical, .trailing])
                .padding(.trailing)
                .padding(.top)
            }
        }
    }
    
    /// The `CameraRoll` button view
    var cameraRollButtonView: some View {
        self.createDefaultButtonView(action: self.viewModel.openCameraRoll) {
            Circle()
                .stroke(lineWidth: 4)
                .shadow(color: .black, radius: 1)
                .shadow(color: .black, radius: 0.5)
                .foregroundStyle(.gray)
                .frame(width: 48, height: 48)
                .overlay {
                    Image(systemName: BottomSheetButton.gallery.imagePath)
                        .imageScale(.medium)
                        .foregroundStyle(.gray)
                        .scaleEffect(0.8)
                }
        }
    }
    
    /// The `SendRequest` button view
    var sendRequestButtonView: some View {
        self.createDefaultButtonView(action: viewModel.sendRequest) {
            Circle()
                .foregroundStyle(
                    RadialGradient(
                        gradient: Gradient(colors: [.white.opacity(0.64), .gray]),
                            center: .topTrailing,
                            startRadius: 16,
                            endRadius: 32
                        )
                )
                .frame(width: 48, height: 48)
                .shadow(color: .black, radius: 1)
                .overlay {
                    Image(systemName: BottomSheetButton.send.imagePath)
                        .imageScale(.large)
                        .foregroundStyle(.white)
                        .padding(.horizontal, self.defaultPadding / 2)
                        .padding(.vertical, self.defaultPadding)
                }
        }
    }
    
    /// The `SearchBar` view
    var searchBarView: some View {
        VStack(spacing: self.defaultSpacing) {
            self.expandableTextView
                .animation(.none, value: true)

            if viewModel.shouldExpandBottomSheet && viewModel.selectedImage == nil { Spacer() }
            
            if let selectedImage = viewModel.selectedImage {
                HStack(spacing: .zero) {
                    self.createGalleryThumbnailPreview(for: selectedImage)
                        .padding(.leading)
                    
                    Spacer()
                }
            }
            
            HStack(spacing: .zero) {
                self.cameraRollButtonView
                Spacer()
                self.sendRequestButtonView
            }
            .padding(.horizontal)
            .padding(.bottom, self.defaultPadding / 2)
        }
        .animation(.interpolatingSpring(stiffness: 320, damping: 200), value: viewModel.shouldExpandBottomSheet)
    }
}

