//
//  DirectorLayer.swift
//  Builder
//
//  Created by Arkadiusz Pituła on 04/06/2021.
//

import SwiftUI

class SubscriptionCardDirector<Builder: CardBuilder> {
    private var builder: Builder

    init(builder: Builder) {
        self.builder = builder
    }

    func construct<Header, Content, BottomBar>(
        headerModel: Header,
        contentModel: Content,
        bottomBar: BottomBar) -> some View where Header == Builder.Header,
                                                 Content == Builder.Content,
                                                 BottomBar == Builder.BottomBar {
        builder.buildHeader(headerModel)
        builder.buildContent(contentModel)
        builder.buildBottomBar(bottomBar)
        return builder.make()
    }
}
