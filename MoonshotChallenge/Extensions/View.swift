// MARK: - LIBRARIES
import Foundation
import SwiftUI



extension View {
    
    func createCapsuleFrame()
    -> some View {
        
        return modifier(CapsuleFrameStyle.init())
    }
}
