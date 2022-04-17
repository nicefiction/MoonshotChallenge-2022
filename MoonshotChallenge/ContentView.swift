// MARK: - LIBRARIES
import SwiftUI



struct ContentView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let astronauts: Dictionary<String, Astronaut> =
    Bundle.main.decode(file: "astronauts",
                       withFileExtension: "json")
    let missions: Array<Mission> =
    Bundle.main.decode(file: "missions",
                       withFileExtension: "json")
    let adaptiveColumnLayout: Array<GridItem> = [
        GridItem(.adaptive(minimum: 120))
    ]
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumnLayout) {
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
            .navigationTitle("Moonshot")
            .preferredColorScheme(.dark)
        }
    }
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS

struct ContentView_Previews: PreviewProvider {
    
    // MARK: - STATIC PROPERTIES
    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {
        
        ContentView()
    }
}
