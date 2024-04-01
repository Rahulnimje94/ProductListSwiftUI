//
//  ProductView.swift
//  ProductApi-SwiftUI
//
//  Created by Rahul on 26/03/24.
//

import SwiftUI

struct ProductView: View {
    
    let viewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
            List(viewModel.product) { product in
                NavigationLink {
                    // destination
                    ProductDetailsView(product: product)
                } label: {
                    // UI row
                    ProductRowView(product: product)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Products")
        }
        .task {
            await viewModel.fetchProduct()
        }
    }
}

#Preview {
    ProductView()
}
