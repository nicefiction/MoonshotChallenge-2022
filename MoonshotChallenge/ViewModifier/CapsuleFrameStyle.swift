// MARK: - LIBRARIES
import Foundation
import SwiftUI



struct CapsuleFrameStyle: ViewModifier {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    func body(content: Content)
    -> some View {
        
        content
            .clipShape(Capsule())
            .overlay(
                Capsule()
                    .strokeBorder(lineWidth: 1.0)
                    .foregroundColor(.white)
            )
    }
    // MARK: - HELPER METHODS
}
