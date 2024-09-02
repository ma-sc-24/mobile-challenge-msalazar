//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import SwiftUI

struct CharacterListScreen: View {
    @StateObject private var viewModel = CharactersViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.characters) { character in
//                Send character name to DetailScreen to show all information
                NavigationLink(destination: CharacterDetailScreen(character: character)) {
//                  Horizontal Stack
                    HStack {
//                      Obtain and show character image with circle shape
                        AsyncImage(url: URL(string: character.image), scale: 5)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        Text(character.name)
                    }
                }
            }
            .navigationTitle("Personajes de Rick y Morty")
            
        }
        .onAppear {
            viewModel.getAllCharacters()
        }
    }
}

// Show a screen preview to visualize on time changes

//#Preview {
//    CharacterListScreen()
//}
