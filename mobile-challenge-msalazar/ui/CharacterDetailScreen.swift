//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import SwiftUI

struct CharacterDetailScreen: View {
    let character: MCharacter

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: character.image))
                .frame(width: 300, height: 300)
                .clipShape(Rectangle())
            Text(character.name)
                .font(.largeTitle)
                .padding()
            Text("Nombre: \(character.name)")
            Text("Estatus: \(character.status)")
            Text("Especie: \(character.species)")
        }
    }
}
