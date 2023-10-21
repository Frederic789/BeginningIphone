//
//  LazyvView.swift
//  BeginingIphone
//
//  Created by Student Account on 10/9/23.
//

import SwiftUI

struct ImageVerticalGridView: View {
    // Define the grid layout
    let columns = [
        GridItem(.adaptive(minimum: 150, maximum: 200), spacing: 20)
    ]
    
    
    let imageData: [(name: String, caption: String)] = [
        ("image1", "Caption 1"),
        ("image2", "Caption 2"),
        ("image3", "Caption 3"),
        ("image4", "Caption 4"),
        ("image5", "Caption 5"),
        ("image6", "Caption 6")
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(imageData, id: \.name) { item in
                VStack(spacing: 10) {
                    Image(item.name)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipped()
                    Text(item.caption)
                }
            }
        }
        .padding()
    }
}

struct ImageVerticalGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageVerticalGridView()
    }
}

