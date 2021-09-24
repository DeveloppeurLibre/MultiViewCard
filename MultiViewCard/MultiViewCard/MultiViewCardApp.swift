//
//  MultiViewCardApp.swift
//  MultiViewCard
//
//  Created by Quentin Cornu on 24/09/2021.
//

import SwiftUI

@main
struct MultiViewCardApp: App {
	
	@State private var value = 2
	
    var body: some Scene {
        WindowGroup {
			MultiViewCard(title: "Number of players", value: $value, content: {
				return [
					MultiViewCardExample(color: .red),
					MultiViewCardExample(color: .yellow),
					MultiViewCardExample(color: .green),
					MultiViewCardExample(color: .blue)
				]
			})
			.frame(height: 250)
			.padding(32)
        }
    }
}
