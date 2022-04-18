// MARK: - LIBRARIES
import SwiftUI



struct MissionView: View {
    
    // MARK: - NESTED TYPES
    struct MissionAstronaut {
        
        // MARK: - NESTED TYPES
        // MARK: - STATIC PROPERTIES
        // MARK: - PROPERTY WRAPPERS
        // MARK: - PROPERTIES
        let role: String
        let astronaut: Astronaut
        
        
        
        // MARK: - INITIALIZERS
        // MARK: - COMPUTED PROPERTIES
        // MARK: - STATIC METHODS
        // MARK: - METHODS
        // MARK: - HELPER METHODS
    }
    
    
    
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let mission: Mission
    let astronauts: Dictionary<String, Astronaut>
    var missionAstronauts: Array<MissionAstronaut>
    
    
    
    // MARK: - INITIALIZERS
    init(mission: Mission,
         astronauts: Dictionary<String, Astronaut>) {
        
        self.mission = mission
        self.astronauts = astronauts
        self.missionAstronauts = mission.crew.map { (eachCrewMember: Mission.CrewMember) in
            if let _missionAstronaut = astronauts[eachCrewMember.name] {
                return MissionAstronaut.init(role: eachCrewMember.role,
                                             astronaut: _missionAstronaut)
            } else {
                fatalError("Missing \(eachCrewMember.name)")
            }
        }
    }
    
    
    
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        GeometryReader { (geometryProxy: GeometryProxy) in
            ScrollView {
                VStack {
                    Image(mission.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometryProxy.size.width * 0.75)
                    Text(mission.formattedLaunchDate)
                        .font(.caption)
                        .padding(.top)
                    Text(mission.description)
                        .font(.body)
                        .padding()
                    Text("• • •  MISSION CREW • • •")
                        .font(.headline)
                        .fontWeight(.heavy)
                }
                ScrollView(.horizontal,
                           showsIndicators: false) {
                    HStack {
                        ForEach(missionAstronauts,
                                id: \.astronaut.id) { (eachMissionAstronaut: MissionAstronaut) in
                            NavigationLink(destination: {
                                AstronautView(missionAstronaut: eachMissionAstronaut.astronaut)
                            }, label: {
                                Image(eachMissionAstronaut.astronaut.id)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 104.0,
                                           height: 72.0)
                                    .clipShape(Capsule())
                                    .overlay(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.0)
                                            .foregroundColor(.white)
                                    )
                                VStack(alignment: .leading) {
                                    Text(eachMissionAstronaut.astronaut.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                    Text(eachMissionAstronaut.role)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            })
                        }
                    }
                }
            }
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MissionView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    static var missions: Array<Mission> =
    Bundle.main.decode(file: "missions",
                       withFileExtension: "json")
    
    static var astronauts: Dictionary<String, Astronaut> =
    Bundle.main.decode(file: "astronauts",
                       withFileExtension: "json")
    
    
    
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        MissionView(mission: missions[1],
                    astronauts: astronauts)
    }
}
