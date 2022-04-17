// MARK: - LIBRARIES
import Foundation



struct Mission: Codable,
                Identifiable {
    
    // MARK: - NESTED TYPES
    struct CrewMember: Codable {
        
        // MARK: - NESTED TYPES
        // MARK: - STATIC PROPERTIES
        // MARK: - NESTED TYPES
        // MARK: - PROPERTY WRAPPERS
        // MARK: - PROPERTIES
        let name: String
        let role: String
        
        
        
        // MARK: - INITIALIZERS
        // MARK: - COMPUTED PROPERTIES
        // MARK: - STATIC METHODS
        // MARK: - METHODS
        // MARK: - HELPER METHODS
    }
    
    
    
    // MARK: - STATIC PROPERTIES
    // MARK: - NESTED TYPES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let id: Int
    let launchDate: Date?
    let crew: Array<CrewMember>
    let description: String
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var displayName: String {
        return "Apollo \(id)"
    }
    
    
    var imageName: String {
        return "apollo\(id)"
    }
    
    
    var formattedLaunchDate: String {
        return launchDate?.formatted(date: .abbreviated,
                                     time: .omitted) ?? "N/A"
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}
