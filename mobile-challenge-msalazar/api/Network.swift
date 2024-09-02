//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import Apollo
import Combine

class Network: ObservableObject {
    static let shared = Network()
    
    @Published private(set) var apollo: ApolloClient

//    Initialize apollo service
    private init() {
        let url = URL(string: Constants.BASE_URL)!
        self.apollo = ApolloClient(url: url)
    }
}
