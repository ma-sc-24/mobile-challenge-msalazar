//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import SwiftUI
import Apollo


class CharactersViewModel: ObservableObject {
    @Published var characters: [MCharacter] = []
    
    private let service = CharacterService()
    
//    Method to get characters from GraphQL service and mapping it
    func getAllCharacters() {
        service.getCharacters { [weak self] result in
            switch result {
            case .success(let results):
                self?.characters = results.map { result in
                    MCharacter(
                        id: result.id,
                        name: result.name,
                        status: result.status,
                        species: result.species,
                        type: result.type,
                        gender: result.gender,
                        image: result.image
                    )
                }
            case .failure(let error):
                print("Error getting characters: \(error)")
            }
        }
    }
}
