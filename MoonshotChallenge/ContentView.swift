// MARK: - LIBRARIES
import SwiftUI



struct ContentView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    @State private var isShowingGridView: Bool = true
    @State private var toolbarTitle: String = "List"
    
    
    
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
            Group {
                if isShowingGridView {
                    MissionGridView.init(astronauts: astronauts,
                                         columnGridLayout: adaptiveColumnLayout,
                                         missions: missions)
                } else {
                    MissionListView.init(astronauts: astronauts,
                                         missions: missions)
                    // .listRowBackground(Color.darkBackground)
                }
            }
            .navigationTitle("Moonshot")
            .toolbar(content: {
                Button(action: {
                    isShowingGridView.toggle()
                    toolbarTitle = isShowingGridView ? "List" : "Grid"
                }, label: {
                    Text(toolbarTitle)
                        .foregroundColor(.white)
                })
            })
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
