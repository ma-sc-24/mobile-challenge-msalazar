//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import Foundation

struct MCharacter: Identifiable, Codable {
    let id: String
    let name: String
    let status: String
    let species: String
    let type: String?
    let gender: String
    let image: String
}

struct MCharactersResponse: Codable {
    let results: [MCharacter]
}

struct MGraphQLResponse: Codable {
    let data: MCharactersData
}

struct MCharactersData: Codable {
    let characters: MCharactersResponse
}
