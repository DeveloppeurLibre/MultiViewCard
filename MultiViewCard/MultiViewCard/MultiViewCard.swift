//
//  MultiViewCard.swift
//  MultiViewCard
//
//  Created by Quentin Cornu on 24/09/2021.
//

import SwiftUI

public protocol MultiViewCardItem: View, Identifiable {}

struct MultiViewCard<Content: MultiViewCardItem>: View {
	
	let title: String
	let views: [Content]
	@Binding var value: Int
	
	private let slideTransition = AnyTransition.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .trailing))
	
	init(title: String, value: Binding<Int>, @ViewBuilder content: () -> [Content]) {
		self.title = title
		self.views = content()
		self._value = value
	}
	
	var body: some View {
		VStack(spacing: 0) {
			HStack(spacing: 0) {
				ForEach(0..<value, id: \.self) { index in
					views[index]
						.transition(slideTransition)
				}
			}
			HStack {
				Text(title)
				Spacer()
				HStack(spacing: 16) {
					Button(action: {
						withAnimation {
							value -= 1
						}
					}, label: {
						Image(systemName: "minus")
							.imageScale(.small)
							.foregroundColor(.black.opacity(0.5))
							.background(
								Circle()
									.foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
									.frame(width: 28, height: 28)
							)
					})
					Text("\(value)")
					Button(action: {
						withAnimation {
							value += 1
						}
					}, label: {
						Image(systemName: "plus")
							.imageScale(.small)
							.foregroundColor(.black.opacity(0.5))
							.background(
								Circle()
									.foregroundColor(Color(red: 0.8, green: 0.8, blue: 0.8))
									.frame(width: 28, height: 28)
							)
					})
				}
			}
			.font(.system(size: 22, weight: .regular))
			.padding(.horizontal, 24)
			.padding(.vertical, 24)
		}
		.background(Color.white)
		.cornerRadius(16)
		.shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
	}
}

struct MultiViewCard_Previews: PreviewProvider {
	
	struct ContainerView: View {
		
		@State private var value = 2
		
		var body: some View {
			MultiViewCard(title: "Number of players", value: $value, content: {
				return [
					MultiViewCardExample(color: .red),
					MultiViewCardExample(color: .yellow),
					MultiViewCardExample(color: .green),
					MultiViewCardExample(color: .blue)
				]
			})
			.frame(height: 280)
			.padding()
		}
	}
	
	static var previews: some View {
		ContainerView()
	}
}
