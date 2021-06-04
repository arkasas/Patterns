//
//  ContentView.swift
//  Builder
//
//  Created by Arkadiusz Pituła on 04/06/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let proDirector = SubscriptionCardDirector(
            builder: ProSubscriptionCardBuilder())
        let proCard = proDirector.construct(
            headerModel: SubscriptionProSample.header,
            contentModel: SubscriptionProSample.content,
            bottomBar: SubscriptionProSample.bottomBar)
        let demoDirector = SubscriptionCardDirector(
            builder: DemoSubscriptionCardBuilder())
        let demoCard = demoDirector.construct(
            headerModel: SubscriptionDemoSample.header,
            contentModel: SubscriptionDemoSample.content,
            bottomBar: SubscriptionDemoSample.bottomBar)
        SubscriptionCardView(card: demoCard)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
