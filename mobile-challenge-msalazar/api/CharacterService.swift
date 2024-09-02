//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import Apollo
import SwiftUI

class CharacterService {
    private let apollo: ApolloClient

//    Obtain apollo param to connect to self Apollo property
    init(apollo: ApolloClient = Network.shared.apollo) {
        self.apollo = apollo
    }

//    Method to get characters from GraphQL service and mapping it
    func getCharacters(completion: @escaping (Result<[GetCharactersQuery.Data.Character.Result], Error>) -> Void) {
        let query = GetCharactersQuery()

        apollo.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let characters = graphQLResult.data?.characters?.results {
                    completion(.success(characters.compactMap { $0 }))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
