//
//  MainScreenView.swift
//  DEAssignment
//
//  Created by Sérgio Ruediger on 22/04/25.
//

import SwiftUI

/// The `MainScreen` module view
struct MainScreenView: MainScreen {
    /// Object that interacts with the back-end
    @StateObject var viewModel: MainScreenViewModel
    
    init(viewModel: MainScreenViewModel = .init()) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: .zero) {
                let chipStackPadding = self.viewModel.chipStackPadding
                
                Spacer()
                
                self.chipStackView
                    .padding(.bottom, chipStackPadding)
                    .animation(.interpolatingSpring, value: chipStackPadding)
                    .ignoresSafeArea(.container, edges: .bottom)
            }
            .background(.white)
            .navigationTitle(self.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    self.createDefaultButtonView(action: viewModel.dismissCurrentScreen) {
                        Image(systemName: self.closeButtonImagePath)
                            .resizable(resizingMode: .stretch)
                            .padding(.vertical, self.defaultPadding)
                            .padding(.leading)
                            .foregroundStyle(.primary)
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.shouldPresentBottomSheet, content: self.createSearchBarBottomSheetView)
        .sheet(isPresented: $viewModel.shouldPresentImagePicker) { CameraRollView(selection: $viewModel.selectedImage) }
        .dynamicTypeSize(...DynamicTypeSize.xxLarge)
        .preferredColorScheme(.light)
    }
}

#Preview {
    MainScreenView()
}
