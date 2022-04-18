//
//  MissionCrewView.swift
//  MoonshotChallenge
//
//  Created by Olivier Van hamme on 18/04/2022.
//

import SwiftUI

struct MissionCrewView: View {
    
    // MARK: - NESTED TYPES
    // MARK: - STATIC PROPERTIES
    // MARK: - PROPERTY WRAPPERS
    // MARK: - PROPERTIES
    let missionAstronauts: Array<MissionView.MissionAstronaut>
    
    
    
    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    var body: some View {
    
        return HStack {
            ForEach(missionAstronauts,
                    id: \.astronaut.id) { (eachMissionAstronaut: MissionView.MissionAstronaut) in
                NavigationLink(destination: {
                    AstronautView(missionAstronaut: eachMissionAstronaut.astronaut)
                }, label: {
                    Image(eachMissionAstronaut.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 104.0,
                               height: 72.0)
                        .createCapsuleFrame()
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
    
    
    
    // MARK: - STATIC METHODS
    // MARK: - METHODS
    // MARK: - HELPER METHODS
}





// MARK: - PREVIEWS
struct MissionCrewView_Previews: PreviewProvider {

    // MARK: - STATIC PROPERTIES
    static let missions: Array<Mission> =
    Bundle.main.decode(file: "missions",
                       withFileExtension: "json")
    static let astronauts: Dictionary<String, Astronaut> =
    Bundle.main.decode(file: "astronauts",
                       withFileExtension: "json")
    static let missionView = MissionView.init(mission: missions[1],
                                              astronauts: astronauts)



    // MARK: - COMPUTED PROPERTIES
    static var previews: some View {

        MissionCrewView(missionAstronauts: missionView.missionAstronauts)
    }
}
