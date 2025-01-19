// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

@available(iOS 13.0, *)
@available(macOS 10.15, *)
public struct ToastMessageView: View {
    public enum ToastType {
        case info, success, warning, error, debug
    }
    
    private let message: String
    private let type: ToastType
    
    public init(message: String, type: ToastType) {
        self.message = message
        self.type = type
    }
    
    private var backgroundColor: Color {
        switch type {
        case .info: return Color.blue.opacity(0.1)
        case .success: return Color.green.opacity(0.1)
        case .warning: return Color.yellow.opacity(0.1)
        case .error: return Color.red.opacity(0.1)
        case .debug: return Color.purple.opacity(0.1)
        }
    }
    
    private var borderColor: Color {
        switch type {
        case .info: return Color.blue
        case .success: return Color.green
        case .warning: return Color.yellow
        case .error: return Color.red
        case .debug: return Color.purple
        }
    }
    
    private var icon: Image? {
        if #available(macOS 11.0, *) {
            switch type {
            case .info: return Image(systemName: "info.circle")
            case .success: return Image(systemName: "checkmark.circle")
            case .warning: return Image(systemName: "exclamationmark.triangle")
            case .error: return Image(systemName: "xmark.octagon")
            case .debug: return Image(systemName: "ladybug")
            }
        } else {
            // Fallback to nil for earlier macOS versions where SFSymbols are not available
            return nil
        }
    }
    
   
    public var body: some View {
        HStack {
            if #available(macOS 11.0, *), #available(iOS 14.0, *) {
                
                if let icon = icon {
                    icon
                        .foregroundColor(borderColor)
                        .imageScale(.large)
                }
            } else {
                
            }

            
            Text(message)
                .foregroundColor(.primary)
                .padding(.leading, 8)
            
            Spacer()
        }
        .padding()
        .background(backgroundColor)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(borderColor, lineWidth: 1)
        )
        .cornerRadius(8)
        .padding(.horizontal)
    }
}
