//
//  SwiftToastfyModifier.swift
//  SwiftToastify
//
//  Created by Wycliff on 19/01/2025.
//

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
struct ToastModifier: ViewModifier {
    @Binding var isVisible: Bool
    let message: String
    let type: ToastMessageView.ToastType
    
    func body(content: Content) -> some View {
        ZStack {
            content
            
            if isVisible {
                ToastMessageView(message: message, type: type)
                    .transition(.move(edge: .top).combined(with: .opacity))
                    .zIndex(1)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation {
                                isVisible = false
                            }
                        }
                    }
            }
        }
    }
}

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public extension View {
    func toast(isVisible: Binding<Bool>, message: String, type: ToastMessageView.ToastType) -> some View {
        self.modifier(ToastModifier(isVisible: isVisible, message: message, type: type))
    }
}
