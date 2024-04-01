//
//  ProductRowView.swift
//  ProductApi-SwiftUI
//
//  Created by Rahul on 26/03/24.
//

import SwiftUI

struct ProductRowView: View {
    
    let product: Product
    
    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: product.image) {
                productImage(url: url)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                // Title
                Text(product.title).font(.headline).lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                
                // Category & Ratings
                HStack {
                    Text(product.category).font(.subheadline).foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "star.fill")
                        Text(product.rating.rate.toString())
                    }.fontWeight(.medium).foregroundStyle(.yellow)
                }
                
                // Description
                Text(product.description).font(.footnote).foregroundStyle(.secondary).lineLimit(3)
                
                // Price & Buy button
                HStack {
                    Text(product.price.currencyFormat()).font(.title3).foregroundStyle(.indigo)
                    
                    Spacer()
                    
                    buyButton
                }
            }
        }.padding()
    }
    
    func productImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable().scaledToFit()
        } placeholder: {
            ProgressView()
        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
    
    var buyButton: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Buy").foregroundStyle(.white).padding(.horizontal).padding(.vertical, 8)
                .background(.indigo).clipShape(.capsule)
        })
    }
}

#Preview {
    ProductRowView(product: Product.dummy)
}
