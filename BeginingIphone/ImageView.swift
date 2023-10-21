//
//  ImageView.swift
//  BeginingIphone
//
//  Created by Student Account on 10/9/23.
//

import SwiftUI

struct ImageGridView: View {
    // Define the grid layout
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
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
        ScrollView {
            LazyHGrid(rows: columns, alignment: .top) {
                ForEach(imageData, id: \.name) { item in
                    VStack {
                        Image(item.name)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                            .clipped()
                        Text(item.caption)
                    }
                }
            }
            .padding()
        }
    }
}

struct ImageGridView_Previews: PreviewProvider {
    static var previews: some View {
        ImageGridView()
    }
}

