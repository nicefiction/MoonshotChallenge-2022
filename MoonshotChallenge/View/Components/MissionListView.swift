// MARK: - LIBRARIES
import SwiftUI



struct MissionListView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let astronauts: Dictionary<String, Astronaut>
    let missions: Array<Mission>
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        List {
            ForEach(missions) { (eachMission: Mission) in
                NavigationLink(destination: {
                    MissionView(mission: eachMission,
                                astronauts: astronauts)
                }, label: {
                    HStack {
                        Image(eachMission.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 75)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(eachMission.displayName)
                            Text(eachMission.formattedLaunchDate)
                                .foregroundColor(.secondary)
                        }
                        .font(.subheadline)
                    }
                })
            }
        }
        .listStyle(PlainListStyle.init())
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MissionListView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static let missions: Array<Mission> =
    Bundle.main.decode(file: "missions",
                       withFileExtension: "json")
    static let astronauts: Dictionary<String, Astronaut> =
    Bundle.main.decode(file: "astronauts",
                       withFileExtension: "json")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MissionListView(astronauts: astronauts,
                        missions: missions)
    }
}
