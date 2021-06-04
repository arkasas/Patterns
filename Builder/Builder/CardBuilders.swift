//
//  CardBuilders.swift
//  Builder
//
//  Created by Arkadiusz Pituła on 04/06/2021.
//

import SwiftUI

protocol CardBuilder {
    associatedtype Card: View
    associatedtype Header
    associatedtype Content
    associatedtype BottomBar
    mutating func buildHeader(_ model: Self.Header)
    mutating func buildContent(_ model: Self.Content)
    mutating func buildBottomBar(_ model: Self.BottomBar)
    @ViewBuilder func make() -> Self.Card
}

struct ProSubscriptionCardBuilder: CardBuilder {
    private var headerModel: ProModels.Header?
    private var contentModel: ProModels.Content?
    private var bottomBarModel: ProModels.BottomBar?

    mutating func buildHeader(_ model: ProModels.Header) {
        self.headerModel = model
    }

    mutating func buildContent(_ model: ProModels.Content) {
        self.contentModel = model
    }

    mutating func buildBottomBar(_ model: ProModels.BottomBar) {
        self.bottomBarModel = model
    }

    func make() -> some View {
        VStack {
            if let headerModel = headerModel {
                createHeader(headerModel)
            }
            if let contentModel = contentModel {
                createContent(contentModel)
            }
            if let bottomBarModel = bottomBarModel {
                createBottomBar(bottomBarModel)
            }
        }
    }
    
    private func createHeader(_ model: ProModels.Header) -> some View {
        HStack {
            VStack {
                Text(model.title)
                    .font(.title)
                    .padding(.top, 10)
                if let subtitle = model.subtitle {
                    Text(subtitle)
                        .font(.title3)
                }
            }
        }
    }
    private func createContent(_ model: ProModels.Content) -> some View {
        VStack {
            Image(model.imageName)
                .resizable()
                .padding(.top, 12)
                .scaledToFit()
            HStack(alignment: .center) {
                Text(model.description)
                    .font(.body)
                    .layoutPriority(1)
            }
            .padding()
        }
    }
    private func createBottomBar(_ model: ProModels.BottomBar) -> some View {
        HStack {
            ForEach(model.buttons) {
                Button($0.title,
                       action: $0.action)
                    .frame(height: 50)
                    .foregroundColor(.black)
                    .padding([.leading, .trailing], 24)
                    .background(Color("Button"))
                    .cornerRadius(12)
                    .shadow(radius: 4)
            }
        }
        .padding(.bottom, 10)
    }
}

struct DemoSubscriptionCardBuilder: CardBuilder {
    private var headerModel: DemoModels.Header?
    private var contentModel: DemoModels.Content?
    private var bottomBarModel: DemoModels.BottomBar?

    mutating func buildHeader(_ model: DemoModels.Header) {
        self.headerModel = model
    }

    mutating func buildContent(_ model: DemoModels.Content) {
        self.contentModel = model
    }

    mutating func buildBottomBar(_ model: DemoModels.BottomBar) {
        self.bottomBarModel = model
    }
    
    func make() -> some View {
        VStack {
            if let headerModel = headerModel {
                createHeader(headerModel)
            }
            if let contentModel = contentModel {
                createContent(contentModel)
            }
            if let bottomBarModel = bottomBarModel {
                createBottomBar(bottomBarModel)
            }
        }
    }
    
    private func createHeader(_ model: DemoModels.Header) -> some View {
        HStack(alignment: .top) {
            Spacer()
            Text(model.title)
                .font(.title)
            Spacer()
            Image(systemName: model.systemImageName)
                .font(.title)
        }
        .padding()
    }
    
    private func createContent(_ model: DemoModels.Content) -> some View {
        VStack {
            HStack {
                ForEach(0 ..< model.imageNames.count-1) {
                    makeImage(name: model.imageNames[$0])
                }
            }
            makeImage(
                name: model.imageNames[model.imageNames.count - 1])
            Text(model.description)
                .font(.title3)
                .padding()
            Spacer()
        }
    }
    
    private func createBottomBar(_ model: DemoModels.BottomBar) -> some View {
        HStack(spacing: 20) {
            ForEach(model.buttons) { button in
                VStack {
                    Text(button.title)
                        .font(.title3)
                        .minimumScaleFactor(0.5)
                        .lineLimit(1)
                    Button(action: button.action, label: {
                        Text(button.subtitle)
                            .foregroundColor(.black)
                            .font(.title)
                    })
                    .padding(.top, 3)
                }
                .padding()
                .background(Color("Button"))
                .cornerRadius(10)
                .shadow(radius: 5)
                .scaleEffect(button.prefersLargeView ? 1.2 : 1.0)
            }
        }
        .padding()
        .padding(.bottom, 20)
    }
    
    private func makeImage(name: String) -> some View {
        Image(name)
            .resizable()
            .frame(width: 80, height: 80)
            .shadow(radius: 10)
    }
}
