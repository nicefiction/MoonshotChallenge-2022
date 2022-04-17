// MARK: - LIBRARIES
import SwiftUI

struct AstronautView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let missionAstronaut: Astronaut
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        ScrollView {
            VStack {
                Image(missionAstronaut.id)
                    .resizable()
                    .scaledToFit()
                Text(missionAstronaut.description)
                    .font(.body)
                    .padding()
            }
        }
        .navigationTitle(missionAstronaut.name)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct AstronautView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static var astronauts: Dictionary<String, Astronaut> =
    Bundle.main.decode(file: "astronauts",
                       withFileExtension: "json")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        AstronautView(missionAstronaut: astronauts["grissom"]!)
    }
}
