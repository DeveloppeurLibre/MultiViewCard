//
//  MultiViewCardExample.swift
//  MultiViewCard
//
//  Created by Quentin Cornu on 24/09/2021.
//

import SwiftUI

struct MultiViewCardExample: MultiViewCardItem {
	
	let color: Color
	let id = UUID()
	
	var body: some View {
		Rectangle()
			.foregroundColor(color)
	}
}

struct MultiViewCardExample_Previews: PreviewProvider {
	static var previews: some View {
		MultiViewCardExample(color: .red)
	}
}
