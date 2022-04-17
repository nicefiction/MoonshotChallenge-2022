// MARK: - LIBRARIES
import Foundation



extension Bundle {

    // MARK: - INITIALIZERS
    // MARK: - COMPUTED PROPERTIES
    // MARK: - METHODS
    func decode<T: Codable>(file: String,
                            withFileExtension fileExtension: String)
    -> T {
        
        guard let _urlToFile = Bundle.main.url(forResource: file,
                                               withExtension: fileExtension)
        else {fatalError("Failed to locate \(file) in bundle.")}
        
        
        guard let _contentsOfFile = try? Data(contentsOf: _urlToFile)
        else {fatalError("Failed to load \(file) from bundle.")}
        
        
        let jsonDecoder = JSONDecoder.init()
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "y-MM-dd"
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard let _decodedData = try? jsonDecoder.decode(T.self,
                                                         from: _contentsOfFile)
        else {fatalError("Failed to decode \(file) from bundle.")}
        
        
        return _decodedData
    }
    /*
     func decode(file: String,
                 withFileExtension fileExtension: String)
     -> Dictionary<String, Astronaut> {
         
         guard let _urlToFile = Bundle.main.url(forResource: file,
                                                withExtension: fileExtension)
         else {fatalError("Failed to locate \(file) in bundle.")}
         
         
         guard let _contentsOfFile = try? Data(contentsOf: _urlToFile)
         else {fatalError("Failed to load \(file) from bundle.")}
         
         
         let jsonDecoder = JSONDecoder.init()
         let dateFormatter = DateFormatter.init()
         dateFormatter.dateFormat = "y-MM-dd"
         jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
         
         guard let _decodedData = try? jsonDecoder.decode(Dictionary<String, Astronaut>.self,
                                                          from: _contentsOfFile)
         else {fatalError("Failed to decode \(file) from bundle.")}
         
         
         return _decodedData
     }
     */
    
    
    
    // MARK: - HELPER METHODS
}
