//
//  SubscriptionCardView.swift
//  Builder
//
//  Created by Arkadiusz Pituła on 04/06/2021.
//

import SwiftUI

struct SubscriptionCardView<Card: View>: View {
    let card: Card
    var body: some View {
        card
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("GradientA"),
                        Color("GradientB")
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .black, radius: 5)
            .padding()
            .frame(height: 550)
    }
}
 
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let demoDirector = SubscriptionCardDirector(
            builder: DemoSubscriptionCardBuilder())
        let demoCard = demoDirector.construct(
            headerModel: SubscriptionDemoSample.header,
            contentModel: SubscriptionDemoSample.content,
            bottomBar: SubscriptionDemoSample.bottomBar)
        SubscriptionCardView(card: demoCard)
            .previewDevice("iPhone 11")
        
        let proDirector = SubscriptionCardDirector(
            builder: ProSubscriptionCardBuilder())
        let proCard = proDirector.construct(
            headerModel: SubscriptionProSample.header,
            contentModel: SubscriptionProSample.content,
            bottomBar: SubscriptionProSample.bottomBar)
        SubscriptionCardView(card: proCard)
            .previewDevice("iPhone 11")
    }
}

// MARK: To test
enum SubscriptionProSample {
    static let header = ProModels.Header(
        title: "Welcome in pro version",
        subtitle: "Now, you are invincible")
    static let content = ProModels.Content(
        imageName: "crown",
        description: "With premium model you can do whatever you wanted. Now you are super-hero")
    static let bottomBar = ProModels.BottomBar(
        buttons: [
            ProModels.ButtonModel(title: "Open Premium Gate", action: {
                print("Did select open premium gate")
            })
        ])
}

enum SubscriptionDemoSample {
    static let header = DemoModels.Header(
        title: "You use demo version",
        systemImageName: "xmark.circle.fill")
    static let content = DemoModels.Content(
        imageNames: ["achievement", "battle", "water"],
        description: "Demo verion allows you to test first level of game")
    static let bottomBar = DemoModels.BottomBar(
        buttons: [
            DemoModels.Button(
                title: "Normal",
                subtitle: "12$",
                action: {},
                prefersLargeView: false),
            DemoModels.Button(
                title: "Premium",
                subtitle: "22$",
                action: {},
                prefersLargeView: true),
            DemoModels.Button(
                title: "Simple",
                subtitle: "2$",
                action: {},
                prefersLargeView: false)
        ])
}
