// MARK: - LIBRARIES
import SwiftUI



struct MissionGridView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let astronauts: Dictionary<String, Astronaut>
    let columnGridLayout: Array<GridItem>
    let missions: Array<Mission>
    

    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        return ScrollView {
            LazyVGrid(columns: columnGridLayout) {
                ForEach(missions) { (eachMission: Mission) in
                    NavigationLink(destination: {
                        MissionView(mission: eachMission,
                                    astronauts: astronauts)
                    }, label: {
                        VStack {
                            Image(eachMission.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 110,
                                       height: 110)
                            Text(eachMission.displayName)
                                .font(.headline)
                                .foregroundColor(.white)
                            Text(eachMission.formattedLaunchDate)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        .padding()
                    })
                }
            }
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct MissionGridView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static let missions: Array<Mission> =
    Bundle.main.decode(file: "missions",
                       withFileExtension: "json")
    static let astronauts: Dictionary<String, Astronaut> =
    Bundle.main.decode(file: "astronauts",
                       withFileExtension: "json")
    static let columnGridLayout: Array<GridItem> = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MissionGridView(astronauts: astronauts,
                        columnGridLayout: columnGridLayout,
                        missions: missions)
    }
}
