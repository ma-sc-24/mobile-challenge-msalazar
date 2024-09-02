//
//  mobile-challenge-msalazar
//
//  Created by Mariana Salazar on 31/8/24.
//

import SwiftUI
import Apollo

@main
struct mobile_challenge_msalazarApp: App {
    
//    Navigation bar title config
    init() {
            let appearance = UINavigationBarAppearance()
            appearance.titleTextAttributes = [.font: UIFont.systemFont(ofSize: 20)]
            appearance.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 30)]
            
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    
//    Initialize App
    var body: some Scene {
        WindowGroup {
            CharacterListScreen()
                .environmentObject(Network.shared)
        }
    }
}
