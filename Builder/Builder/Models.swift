//
//  Models.swift
//  Builder
//
//  Created by Arkadiusz Pituła on 04/06/2021.
//

import Foundation

struct ProModels {
    struct Header {
        let title: String
        let subtitle: String
    }
    
    struct Content {
        let imageName: String
        let description: String
    }
    
    struct BottomBar {
        let buttons: [ButtonModel]
    }
    
    struct ButtonModel: Identifiable {
        let id = UUID()

        let title: String
        let action: () -> Void
    }

}

struct DemoModels {
    struct Header {
        let title: String
        let systemImageName: String
    }
    
    struct Content {
        let imageNames: [String]
        let description: String
    }
    
    struct BottomBar {
        let buttons: [Button]
    }
    
    struct Button: Identifiable {
        let id = UUID()

        let title: String
        let subtitle: String
        let action: () -> Void
        let prefersLargeView: Bool
    }
}
